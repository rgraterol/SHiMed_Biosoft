module EmpresasHelper
  def fecha_creacion_fixer(actor)
    @fecha_creacion_fixed = Date.strptime("#{params[actor][:"fechaCreacion(3i)"].to_i}/#{params[actor][:"fechaCreacion(2i)"].to_i}/#{params[actor][:"fechaCreacion(1i)"].to_i}", "%d/%m/%y")
  end
end