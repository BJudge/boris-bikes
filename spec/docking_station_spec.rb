require './lib/docking_station.rb'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:bike) }

  describe '#release_bike' do
  it 'raises an error when there are no bikes' do
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  it 'releases a bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end
end

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    subject.release_bike
    expect(bike).to be_working
  end

describe "#dock_bike" do
  it 'raises an error when docking station is full' do
    bike = Bike.new
    subject.dock(bike)
    expect { subject.dock(bike) }.to raise_error 'Docking Station is full'
  end

  it 'docks bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end
end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end
end
