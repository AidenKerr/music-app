class Chord
  include ActiveModel::Model
  attr_accessor :notes, :root, :intv, :chord

  def notesArray
    # Array of all notes.
    # Enharmonic notes are wriiten together and (todo) split when required
    ['A', 'A# Bb', 'B', 'C', 'C# Db', 'D', 'D# Eb', 'E', 'F', 'F# Gb', 'G', 'G# Ab']
  end

  def interval
    rootIndex = notesArray.index(root)

    notesArray[(rootIndex + intv) % notesArray.length]
  end
end
