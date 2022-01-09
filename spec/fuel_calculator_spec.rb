require 'spec_helper'
require 'calculate_fuel'

RSpec.describe CalculateFuel do
  describe 'Trip to the moon' do
    let!(:spaceship_mass) { 28_801 }
    let!(:spaceship_path) do
      [
        [:launch, 9.807],
        [:land, 1.62],
        [:launch, 1.62],
        [:land, 9.807]
      ]
    end

    it 'calculate fuel for the trip' do
      fuel_mass = CalculateFuel.calculate(spaceship_mass, spaceship_path)
      expect(fuel_mass).to eq(51_898)
    end
  end

  describe 'Trip to the mars' do
    let!(:spaceship_mass) { 14_606 }
    let!(:spaceship_path) do
      [
        [:launch, 9.807],
        [:land, 3.711],
        [:launch, 3.711],
        [:land, 9.807]
      ]
    end

    it 'calculate fuel for the trip' do
      fuel_mass = CalculateFuel.calculate(spaceship_mass, spaceship_path)
      expect(fuel_mass).to eq(33_388)
    end
  end

  describe 'Tirp to the moon and mars' do
    let!(:spaceship_mass) { 75_432 }
    let!(:spaceship_path) do
      [
        [:launch, 9.807],
        [:land, 1.62],
        [:launch, 1.62],
        [:land, 3.711],
        [:launch, 3.711],
        [:land, 9.807]
      ]
    end

    it 'calculate fuel for the trip' do
      fuel_mass = CalculateFuel.calculate(spaceship_mass, spaceship_path)
      expect(fuel_mass).to eq(212_161)
    end
  end
end
