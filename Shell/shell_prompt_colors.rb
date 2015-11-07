# encoding: UTF-8
=begin

Pour retourner les balises d'un texte en couleur dans le shell
Copier ce fichier dans l'application qui doit l'utiliser

@usage

    Pour obtenir un message à prompter

    pr = ShellPrompt <messages>[, <parametres>]

    pr.out   # => le message à prompter, p.e. `STDOUT.write pr.out`

    Pour obtenir seulement des balises à mettre autour d'un messages

    pr = ShellPrompt parametres

    pr.open_tag   # => la balise d'ouverture
    pr.close_tag  # => la balise de fermeture

    Par exemple : STDOUT.write "#{pr.open_tag}Mon message#{pr.close_tag}"


    <parametres> (toutes les clés sont optionnelles)
      {
        color:          <code couleur>, # parmi :white, :black, :yellow, :red, :green, :cyan, :purple
                                        # défaut : :black
        style:          <code style>,   # parmi :normal, :bold, :underline
                                        # défaut : :normal
        background:     true/false,     # défaut : false
        high_intensity: true/false      # défaut : false
      }

=end
class ShellPrompt
  
  RESET_COLOR = "\e[0m"

  attr_reader :message
  attr_reader :color
  attr_reader :style
  attr_reader :background
  attr_reader :high_intensity

  def initialize message, params = nil
    if message.class == Hash
      params  = message 
      message = ""
    end
    @message        = message || "-- no message --"
    @style          = params[:style] || :normal
    @high_intensity = params[:high_intensity] || false
    @background     = params[:background] || false
    @color          = params[:color] || :black
  end
  
  # Code à prompter
  def out
    "#{open_tag}#{message}#{close_tag}"
  end
  # Code pour la balise d'ouverture
  def open_tag
    OpenTag::new( self ).out
  end
  # Code pour la balise de fermeture
  def close_tag
    RESET_COLOR
  end
  
  class OpenTag
    BASH_STYLE = {
      normal: 0, bold: 1, underline: 4, high_intensity: 0
    }
    attr_reader :prompt
    attr_reader :color
    def initialize prompt
      @prompt = prompt
      @color  = ::ShellPrompt::Color::new( self, prompt.color )
    end
    def out
      "\e[#{font_or_bkg}#{color.out}m"
    end
    def font_or_bkg
      return "" if prompt.background === true
      "#{BASH_STYLE[prompt.style]};"
    end
    
  end
  class Color
    BASH_COLOR = {
      black: 30, red: 31, green: 32, yellow: 33, blue: 34, purple: 35, cyan: 36, white: 37
    }
    attr_reader :color
    attr_reader :background
    attr_reader :high_intensity
    def initialize otag, color
      @color          = color
      @background     = otag.prompt.background
      @high_intensity = otag.prompt.high_intensity
    end
  
    def out
      x = BASH_COLOR[color]
      x += 10 if background === true
      x += 60 if high_intensity === true
      return x
    end
    # ---------------------------------------------------------------------
    #   Définitions
    
    def normal
      @normal ||= BASH_COLOR[color]
    end
    def background
      @bold ||= normal + 10
    end
    def high_intensity
      @high_intensity ||= normal + 60
    end
    def high_intensity_background
      @high_intensity_background ||= normal + 70
    end
  end
end