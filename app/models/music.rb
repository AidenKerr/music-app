class Music
  def notes
    # Array of all notes.
    # Enharmonic notes are wriiten together and (todo) split when required
    ['A', 'A# Bb', 'B', 'C', 'C# Db', 'D', 'D# Eb', 'E', 'F', 'F# Gb', 'G', 'G# Ab']
  end
  
  # root - string - root of chord
  # intv - integer - interval in semitones
  def interval(root, intv)
    rootIndex = notes.index(root)
    notes[(rootIndex+intv) % notes.length]
  end
  
  
end