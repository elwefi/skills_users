module SqlQuery
  class SkillsPoints

    def self.perform
      ActiveRecord::Base.connection.execute("SELECT SUM(points) as points, COUNT(new_parent_id) count, name
        from (
          select points, CASE
            when skills.parent_id ISNULL
              then skills.id
              else skills.parent_id
            end as new_parent_id

          from skills
          join skills_users
            on (skills.id=skill_id)
          join users
            on user_id=users.id
          ) as new_table
          join skills
            on skills.id= new_parent_id
        group by name"
      )
    end

  end
end