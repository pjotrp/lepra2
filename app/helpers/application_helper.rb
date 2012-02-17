
module ApplicationHelper

  def lepra_version
    @_lepra_version ||= File.read('VERSION')
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

  # require 'bluecloth'
  require 'maruku'

  def parse_markdown buf
    # BlueCloth.new(buf).to_html
    Maruku.new(buf).to_html
  end
end
