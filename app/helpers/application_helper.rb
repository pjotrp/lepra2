module ApplicationHelper

  def tr_text f, field, *opts
    html = <<EOP
      <tr>
        <td>
          #{f.label field}
        </td>
        <td>
          #{f.text_field field, *opts}
        </td>
      </tr>
EOP
    html
  end

  def tr_number f, field, *opts
    html = <<EOP
      <tr>
        <td>
          #{f.label field}
        </td>
        <td>
          #{f.number_field field, *opts}
        </td>
      </tr>
EOP
    html
  end

  def tr_check_box f, field, *opts
    html = <<EOP
      <tr>
        <td>
          #{f.label field}
        </td>
        <td>
          #{f.check_box field, *opts}
        </td>
      </tr>
EOP
    html
  end
  def tr_date f, field, *opts
    html = <<EOP
      <tr>
        <td>
          #{f.label field}
        </td>
        <td>
          #{f.text_field(field,*opts)}
        </td>
      </tr>
EOP
    html
  end
end
