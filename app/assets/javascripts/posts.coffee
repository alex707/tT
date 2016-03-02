path_to_wall = window.location.href.split "/walls/"
num_wall = path_to_wall[1]

source = new EventSource('/streaming/' + num_wall)

source.addEventListener 'message', (e) ->
  mes = $.parseJSON(e.data)
 
  d1 = mes.created_at.split "T"
  d2 = d1[1].split ":"

  $('#posts').prepend($('<br/>'))
  $('#posts').prepend("#{mes.content}")
  $('#posts').prepend($('<b>').text("#{mes.post_name} "))
  $('#posts').prepend($('<i>').text("#{d2[0]}:#{d2[1]} "))
