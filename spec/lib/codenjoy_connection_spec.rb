require 'spec_helper'

describe CodenjoyConnection do
  before(:each) do
    @params = {:host => 'localhost', :port => '8080', :username => 'anatoli'}
  end

  describe "#prepare_url" do
    describe 'params validation' do
      it "should fail without required params" do
        expect{ CodenjoyConnection.prepare_url }.to raise_error(CodenjoyConnection::GenericError, "Please, specify connection params.")
      end

      it "should fail without host param" do
        params = @params.tap{|x| x.delete(:host)}
        expect{ CodenjoyConnection.prepare_url(params) }.to raise_error(CodenjoyConnection::GenericError, "Please, specify a host for connection.")
      end

      it "should fail without port param" do
        params = @params.tap{|x| x.delete(:port)}
        expect{ CodenjoyConnection.prepare_url(params) }.to raise_error(CodenjoyConnection::GenericError, "Please, specify a port for connection.")
      end

      it "should fail without username param" do
        params = @params.tap{|x| x.delete(:username)}
        expect{ CodenjoyConnection.prepare_url(params) }.to raise_error(CodenjoyConnection::GenericError, "Please, specify a username for connection.")
      end
    end

    describe 'url validation' do
      it "should prepair correct url without game_url" do
        url = CodenjoyConnection.prepare_url(@params)
        expect(url).to eq('ws://localhost:8080/tetris-contest/ws?user=anatoli')
      end

      it "should prepair correct url with game_url" do
        url = CodenjoyConnection.prepare_url(@params.merge(:game_url => 'mine/ws?'))
        expect(url).to eq('ws://localhost:8080/mine/ws?user=anatoli')
      end
    end
  end

  describe "#play" do
    before(:each) do
      @player = double({})
      allow(@player).to receive(:process_data)
      allow(@player).to receive(:make_step)

      expect(CodenjoyConnection).to receive(:prepare_url).with(@params)
      expect(CodenjoyConnection).to receive(:set_connection)
    end

    it "should call #prepare_url and #set_connection" do
      CodenjoyConnection.play(@player, @params)
    end
  end
end
