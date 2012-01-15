module ApplicationHelper

  def f_text f, field
    html = <<EOP
      <tr>
        <td>
          #{f.label field}
        </td>
        <td>
          #{f.text_field field}
        </td>
      </tr>
EOP
    html
  end
  def f_number f, field
    html = <<EOP
      <tr>
        <td>
          #{f.label field}
        </td>
        <td>
          #{f.number_field field}
        </td>
      </tr>
EOP
    html
  end
end
