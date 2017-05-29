module FichasHelper

  def status_representation(status)
    if(status == "Aprovado")
      return getIcon("glyphicon glyphicon-ok", "Aprovado", "green")
    elsif (status == "Enviado")
      return getIcon("glyphicon glyphicon-refresh", "Enviado", "black")
    else
      return getIcon("glyphicon glyphicon-ban-circle", "Reprovado", "red")
    end
  end


  def getIcon(style, tip, color)
    return "<i class='#{style}' style='color: #{color}' title ='#{tip}' data-toggle = 'tooltip' data-placement = 'right'></i>"
  end
  def getSemester(ficha)
    return ficha.semester.to_s + " / " + ficha.year.to_s
  end
#<td><center><%= ficha.created_at.strftime("%d/%m/%Y") %></center></td>
end
