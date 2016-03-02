class PostsController < ApplicationController
  include ActionController::Live

  def index
    @posts = Post.order("id DESC").all
  end


  def create
    @post = Post.create!(post_params)
    $redis.publish("post.create#{@post.wall_id}", @post.to_json)
  end

  def events
    response.header["Content-Type"] = "text/event-stream"
    start = Time.zone.now
    redis = Redis.new
    redis.subscribe("post.create#{params[:id]}") do |on|
      on.message do |event, data|
        response.stream.write("data: #{data}\n\n")
      end
    end

    #10.times do |n|
    #  Post.uncached do
    #    Post.where('created_at > ?', start).each do |post|
    #      logger.debug "___________________#{post.to_json}"
    #      response.stream.write "data: #{post.to_json}\n\n"
    #      start = post.created_at
    #    end
    #  end
    #  sleep 5 
    #end
  rescue IOError
    logger.info "Stream closed"
  ensure
    redis.quit
    response.stream.close
  end
  private

  def post_params
    params.require(:post).permit(:post_name, :content, :wall_id)
  end

end
