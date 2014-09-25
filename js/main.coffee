$ ->

  # ===============
  # keyboard events
  # ===============
  #
  # - Key Down event
  $('body').keydown (e) =>
    key = e.which
    keys = [37..40]
  #   1. Check the keys are arrow keys
    if $.inArray(key, keys) > -1
      e.preventDefault()
  #   2. Prevent default event
  #   3. Detect the arrow direction
    direction = switch key
      when 37 then 'left'
      when 38 then 'up'
      when 39 then 'right'
      when 40 then 'down'
  #   4. Move the board
    newBoard = move(@board, direction)
  #   5. Check the move validity
    if moveIsValid(newBoard, @board)
  #     - generate new tile
      @board = newBoard
      generateTile(@board)
  #     - show board
      showBoard(@board)
  #     - check win / lose
      if gameLost(@board)
        console.log "Game Over!"
      else if gameWon(@board)
        console.log "Congratulations"
  # - Initialize Game
  @board = buildBoard()
  generateTile(@board)
  generateTile(@board)

  # - Show Board
  showBoard(@board)
