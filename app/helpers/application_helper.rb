module ApplicationHelper

  def lepra_version
    @_lepra_version ||= File.read('VERSION')
  end

  def render_label s
    s1 = s.gsub(/_/,' ').sub(/^symbol /,'').capitalize
    s2 = s1.sub(/ r$/,' right')
    s3 = s2.sub(/ l$/,' left')
    s3
  end

  def render_value value
    if value.class == TrueClass
      "Yes"
    elsif value.class == FalseClass
      "No"
    else
      value.to_s
    end
  end
 
  def tr_text f, field, *opts
    haml = <<EOP
%tr
  %td
    #{f.label field}
  %td
    #{f.text_field field, *opts}
EOP
    Haml::Engine.new(haml).render
  end

  def tr_symbol f, field, *opts
    label = field.to_s.sub(/symbol_/,'').to_sym
    html = <<EOP
      <tr>
        <td>
          #{f.label label}
        </td>
        <td>
          #{f.text_field field, *opts}
        </td>
      </tr>
EOP
  end

  # Show a number. The default size of the field is 8
  def tr_number f, field, opts = { :size => '8' }
    haml = <<EOP
%tr
  %td
    #{f.label field}
  %td
    .number
      #{f.number_field field, opts  }
EOP
    Haml::Engine.new(haml).render
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

  alias tr_boolean tr_check_box

  def tr_boolean3 f, field, *opts
    haml = <<EOP
%tr
  %td
    #{f.label field}
  %td.boolean3
    #{f.radio_button field, true}
    #{f.label field, "Yes"}
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;/
    &nbsp;&nbsp;&nbsp;
    #{f.radio_button field, false}
    #{f.label field, "No"}
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    #{f.radio_button field, ""}
    #{f.label field, "Unknown"}
EOP
    Haml::Engine.new(haml).render
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

  # require 'bluecloth'
  require 'maruku'

  def parse_markdown buf
    # BlueCloth.new(buf).to_html
    Maruku.new(buf).to_html
  end
end
