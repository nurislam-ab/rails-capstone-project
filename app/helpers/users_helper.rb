# UsersHelper
module UsersHelper
    def avatar_attached(field, avatar)
        html_block = ""
        if @user.avatar.attached?
            html_block += <<-HTML
                #{field.file_field avatar}
            HTML
        else
            html_block += <<-HTML
            #{field.file_field avatar, required: true}
            HTML
        end

        html_block.html_safe
    end
end
