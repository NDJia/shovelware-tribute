function updateGameAudio()
  if audioPlaying == 0 and not gamebgm:isPlaying() then
    local choose = math.floor(love.math.random(4))
    audioPlaying = choose
    radiovoice[choose]:play()
  
  elseif audioPlaying ~= 0 and love.audio.getActiveSourceCount() < 1 then
    audioPlaying = 0
    gamebgm:play()
    gamebgm:seek(love.math.random(20), "seconds")
  end
  
  
end
