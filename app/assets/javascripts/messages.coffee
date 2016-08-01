window.MessagesJs =
  init: ->
    console.log("messages is run")
    $("input#content").keydown (event) ->
      if event.keyCode is 13
        console.log "key down", event
        App.messages.create(event.target.value)
        event.target.value = ''

    $(".message").on 'click', 'a.close', (event) ->
      messageId = $(this).data('message-id')
      console.log("message id", $(this).data('message-id'))
      App.messages.destroy(messageId)
      event.preventDefault()
      return false
