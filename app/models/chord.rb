class Chord
  include ActiveModel::Model
  attr_accessor :notes, :root, :interval, :accidental, :chord
  
  def notesArray
    # Array of all notes.
    # Enharmonic notes are wriiten together and (todo) split when required
    ['A', 'A# Bb', 'B', 'C', 'C# Db', 'D', 'D# Eb', 'E', 'F', 'F# Gb', 'G', 'G# Ab']
  end
  
  # eventually this will be used with an array of intervals to create a chord
  def createChord
    @rootIndex = notesArray.index(root)
    
    case accidental
      when '#'
        @rootIndex += 1
        self.root = notesArray[@rootIndex % notesArray.length].split(" ").first
      when 'b'
        @rootIndex -= 1
        self.root = notesArray[@rootIndex % notesArray.length].split(" ").last
    end
    
    findInterval
  end
  
  def findInterval
    # indexes greater than the length of the array to loop around to the beginning.
    intervalNote = notesArray[(@rootIndex + interval) % notesArray.length]
    
    case accidental
      when '#'
        intervalNote = intervalNote.split(" ").first
      when 'b'
        intervalNote = intervalNote.split(" ").last
    end
    
    "#{interval} semitones from #{root}: #{intervalNote}"
  end
end