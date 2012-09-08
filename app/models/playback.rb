class Playback
  
  @playlist = []
  @action = ['play', 'pause', 'stop', 'skip', 'previous']
  
  def initialize
    @playlist = []
    # initialize openal driver
  end
  
  def receive_message!(message)
    payload = JSON.parse(message)
    
    if @actions.include? payload.action
      sym = payload.action.to_sym
      method = self.method(sym)
      if method.arity > 0
        method.call(*payload.data.slice(0, method.arity))
      else
        method.call
      end
    end
  end

  def play(playlist = [])
    unless playlist.blank?
      @playlist = playlist
    end
    
    skip
  end
  
  def seek(position)
    
  end
  
  def skip
    
  end
  
  def previous
    
  end
  
  def pause
    
  end
  
  def stop
    
  end
  
end