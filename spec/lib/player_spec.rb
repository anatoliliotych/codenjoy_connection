require 'spec_helper'
describe CodenjoyConnection::Player do
  describe "validation" do
    before(:each) do
      @player = double({})
    end
    it "should fail if player object has no #process_data" do
      expect{ CodenjoyConnection::Player.new(@player) }.to raise_error(CodenjoyConnection::GenericError, 'Please, override #process_data in your player class.')
    end

    it "should fail if player object has no #make_step" do
      allow(@player).to receive(:process_data)
      expect{ CodenjoyConnection::Player.new(@player) }.to raise_error(CodenjoyConnection::GenericError, 'Please, override #make_step in your player class.')
    end
  end

  describe 'methods' do
    before(:each) do
      @player = double({})
      allow(@player).to receive(:process_data)
      allow(@player).to receive(:make_step)
      @cj_player = CodenjoyConnection::Player.new(@player)
    end

    describe "#process_data" do
      it 'should call #process_data on provided object with params' do
        expect(@player).to receive(:process_data).with("")
        @cj_player.process_data("")
      end
    end

    describe "#make_step" do
      it 'should call #make_step on provided object' do
        expect(@player).to receive(:make_step)
        @cj_player.make_step
      end
    end
  end
end


