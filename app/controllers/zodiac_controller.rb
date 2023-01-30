class ZodiacController < ApplicationController
  def horoscope
    @signo = params.fetch("sign").to_sym

    all_zodiacs = Zodiac.list
    this_zodiac = all_zodiacs.fetch(@signo)
    @horoscope = this_zodiac.fetch(:horoscope)
    @sign_name = this_zodiac.fetch(:name)

    @array_of_numbers = Zodiac.lucky_numbers

    render({ :template => "zodiac_templates.html.erb" })
  end

end
