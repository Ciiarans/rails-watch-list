class AddForeignKeyConstraintToBookmarks < ActiveRecord::Migration[6.0]
  def change
    # Vérifier si la contrainte de clé étrangère pour :movie_id existe déjà
    unless foreign_key_exists?(:bookmarks, :movies)
      add_foreign_key :bookmarks, :movies, on_delete: :restrict
    end

    # Vérifier si la contrainte de clé étrangère pour :list_id existe déjà
    unless foreign_key_exists?(:bookmarks, :lists)
      add_foreign_key :bookmarks, :lists, on_delete: :cascade
    end
  end
end
