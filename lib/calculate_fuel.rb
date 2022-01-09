class CalculateFuel
  class << self
    def calculate(spaceship_mass, spaceship_path)
      spaceship_with_fuel_mass = calculate_spaceship_with_fuel_mass(spaceship_mass, spaceship_path)
      spaceship_with_fuel_mass - spaceship_mass
    end

    private

    def calculate_spaceship_with_fuel_mass(spaceship_with_fuel_mass, spaceship_path)
      spaceship_path.reverse.each do |action, gravity|
        @index = 0
        @fuel_mass_per_action = 0
        spaceship_with_fuel_mass += calculate_fuel_per_action(spaceship_with_fuel_mass, action, gravity)
      end

      spaceship_with_fuel_mass
    end

    def calculate_fuel_per_action(fuel_mass, action, gravity)
      @fuel_mass_per_action += fuel_mass if @index.positive?
      fuel_mass = calculate_fuel(action, fuel_mass, gravity)
      return @fuel_mass_per_action if fuel_mass < 1

      @index += 1
      calculate_fuel_per_action(fuel_mass, action, gravity)
    end

    def calculate_fuel(action, mass, gravity)
      if action == :launch
        (mass * gravity * 0.042 - 33).floor
      else
        (mass * gravity * 0.033 - 42).floor
      end
    end
  end
end
