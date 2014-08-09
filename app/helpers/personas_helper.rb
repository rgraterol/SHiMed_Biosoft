module PersonasHelper
  def fecha_nacimiento_fixer(actor)
    @fecha_nacimiento_fixed = Date.strptime("#{params[actor][:"fecha_nacimiento(3i)"].to_i}/#{params[actor][:"fecha_nacimiento(2i)"].to_i}/#{params[actor][:"fecha_nacimiento(1i)"].to_i}", "%d/%m/%y")
  end
end
