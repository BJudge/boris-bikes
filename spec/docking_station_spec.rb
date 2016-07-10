require 'docking_station'

describe DockingStation do

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
    expect{ subject.dock(bike) }.to raise_error 'Cannot accept bike - Full'
    end
  end

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
    it 'does not release a bike when reported broken' do
      bike=Bike.new
      bike.report_broken
      subject.dock(bike)
      expect { subject.release_bike}.to raise_error ("Sorry, the bikes are broken")
    end
  end

  it 'is working' do
    bike = Bike.new
    expect(bike).to be_working
  end

  describe 'dock' do
    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end
    it 'return docked bikes' do
      bike = Bike.new
      subject.dock(bike)
    end

     it { is_expected.to respond_to(:dock).with(2).argument }

    it 'raises an error when full' do
         subject.capacity.times { subject.dock Bike.new }
         expect { subject.dock Bike.new }.to raise_error 'Cannot accept bike - Full'
        #DockingStation::DEFAULT_CAPACITY.times do
        #  subject.dock Bike.new

         #20.times { subject.dock Bike.new }
         #expect { subject.dock Bike.new }.to raise_error "Cannot accept bike - Full"
    end



      #bike = Bike.new
      #subject.dock(bike)
      #bike2 = Bike.new
      #expect { subject.dock(bike2) }.to raise_error("Cannot accept bike - Full")

  end
  #it 'has a default capcity' do
  #  expect(subject.capcity).to eq DockingStation::DEFAULT_CAPACITY

end

=begin
Should we also have this:
it 'release working bikes' do
  bike = subject.release_bike
  expect(bike).to be_working
end
=end
