require 'docking_station'

describe DockingStation do

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    # Do we want this:?
    it {is_expected.to respond_to :release_bike}
    it 'raises an error if there are no bikes' do
      expect { subject.release_bike }.to raise_error("No bikes!")
    end
  end

  it 'is working' do
    bike = Bike.new
    expect(bike).to be_working
  end

  describe '#dock' do
    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end
    it 'return docked bikes' do
      bike = Bike.new
      subject.dock(bike)
    end
  
    describe 'raises an error when docking station is at capacity' do
       it 'raises an error when full' do
         20.times { subject.dock Bike.new }
         expect { subject.dock Bike.new }.to raise_error "Cannot accept bike - Full"

       end

      #bike = Bike.new
      #subject.dock(bike)
      #bike2 = Bike.new
      #expect { subject.dock(bike2) }.to raise_error("Cannot accept bike - Full")
    end
  end

end

=begin
Should we also have this:
it 'release working bikes' do
  bike = subject.release_bike
  expect(bike).to be_working
end
=end
