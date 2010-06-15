module ListasHelper
  def show_dostep(lista)
    unless lista.nil?
      lista.dostep == 'p' ? 'prywatna' : 'publiczna'
    end
  end
end
