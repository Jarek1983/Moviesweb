class AddAttachmentMovieToMovies < ActiveRecord::Migration[5.2]
  def self.up
    change_table :movies do |t|
      t.attachment :movie
    end
  end

  def self.down
    remove_attachment :movies, :movie
  end
end
