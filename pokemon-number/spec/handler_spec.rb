require 'spec_helper'
require 'handler'

describe 'handler(event)' do
  let(:event) {Event.new(
    body: JSON.dump({"text" => "1"}),
    query_params: {},
    headers: {},
    context: nil
  )}

  it 'should return a String' do
    body = handler(event).body
    expect(body).to be_a(String)
  end

  it 'should reply ポケモンの名前!' do
    body = handler(event).body
    expect(body).to eq "フシギダネ"
  end

  context '存在しない番号のとき' do
    let(:event) {Event.new(
        body: JSON.dump({"text" => "1000"}),
        query_params: {},
        headers: {},
        context: nil
    )}

    specify "'けつばん'を返すこと" do
      body = handler(event).body
      expect(body).to eq "けつばん"
    end
  end
end
