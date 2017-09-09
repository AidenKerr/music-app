class Chord
  include ActiveModel::Model
  
  # rootBase    The root with no accidentals. (C -> C, Bb -> B, A# -> A)
  # displayRoot The root including accidentals. Used for display purposes
  # intervals   String of intervals used in the chord separated by spaces
  # accidental  Either sharp (#) or flat (b)
  attr_accessor :rootBase, :displayRoot, :intervals, :accidental
  
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
    
    self.intervals.split(" ").map{ |n| findInterval(n.to_i) }
    
  end


  def findInterval(interval)
      # indexes greater than the length of the array to loop around to the beginning.
      intervalNote = notesArray[(@rootIndex + interval) % notesArray.length]
      
      # choosing the appropriate enharmonic note.
      # Chooses based on currently selected accidental on root note
      # If no accidental on root, it defaults to a sharp
      # Eventually there should be a toggle.
      case accidental
        when '#'
          intervalNote = intervalNote.split(" ").first
        when 'b'
          intervalNote = intervalNote.split(" ").last
        else
          intervalNote = intervalNote = intervalNote.split(" ").first
      end
      
      intervalNote
  end
end