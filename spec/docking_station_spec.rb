require 'docking_station'

describe DockingStation do 

    describe '#release_bike' do
        it 'raises an error when there are no bikes available' do
            expect { subject.release_bike }.to raise_error 'No bikes available'
        end 
    end 

    describe '#docking_bike' do 
        it 'raises an error when you dock a bike - if a bike is already docked' do
            subject.dock(Bike.new)
            expect { subject.dock(Bike.new) }.to raise_error 'No spaces for docking'
        end 
    end 

    it { is_expected.to respond_to(:release_bike) } 

    it { is_expected.to respond_to(:dock).with(1).argument }

    it { is_expected.to respond_to(:bike) }

    it 'releases working bikes' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.release_bike).to eq bike 
    end 

    it 'docks something' do
        bike = Bike.new
        expect(subject.dock(bike)).to eq bike 
    end 
    
    it 'returns docked bike' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.bike).to eq bike 
    end 

end 
    
