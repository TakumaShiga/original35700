class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.text       :message,  null: false
      t.references :question, foreign_key: true
      t.references :user,     foreign_key: true
      t.timestamps
    end
  end
end
