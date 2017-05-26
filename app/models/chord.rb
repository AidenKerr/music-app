class Chord
  include ActiveModel::Model
  
  # rootBase    The root with no accidentals. (C -> C, Bb -> B, A# -> A)
  # displayRoot The root including accidentals. Used for display purposes
  # interval    The interval between two notes (in semitones)
  # accidental  Either sharp (#) or flat (b)
  # chordType   (todo) The type of chord requested
  attr_accessor :rootBase, :displayRoot, :intervals, :accidental, :chordType
  
  def notesArray
    # Array of all notes.
    # Enharmonic notes are written together and split when required
    ['A', 'A# Bb', 'B', 'C', 'C# Db', 'D', 'D# Eb', 'E', 'F', 'F# Gb', 'G', 'G# Ab']
  end
  
  # eventually this will be used with an array of intervals to create a chord
  def createChord
    @rootIndex = notesArray.index(rootBase)
    
    # if a note has an accidental, 
    # shift it's index appropriately
    # and set the display root to be the appropriate note in that position
    case accidental
      when '#'
        @rootIndex += 1
        self.displayRoot = notesArray[@rootIndex % notesArray.length].split(" ").first
      when 'b'
        @rootIndex -= 1
        self.displayRoot = notesArray[@rootIndex % notesArray.length].split(" ").last
      else
        self.displayRoot = self.rootBase
    end
    
    # Will be implemented later
    # getIntervalsFromChordType
    
    findInterval
  end
  
  def findInterval
    
    
    # PROBLEM
    # because of the way the program is set up to expect accidentals
    # I'll solve this later
    
    self.intervals = self.intervals.split(" ").map{ |n| n.to_i }
    
    chordArray = Array.new
    
    for interval in intervals
      # indexes greater than the length of the array to loop around to the beginning.
      intervalNote = notesArray[(@rootIndex + interval) % notesArray.length]
      
      # choosing the appropriate enharmonic note.
      case accidental
        when '#'
          intervalNote = intervalNote.split(" ").first
        when 'b'
          intervalNote = intervalNote.split(" ").last
      end
      
      chordArray.push(intervalNote)
    end
    
    chordArray
  end
end