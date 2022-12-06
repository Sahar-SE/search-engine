require 'rails_helper'

RSpec.describe Search, type: :model do
    let(:visitor) { Visitor.create! }
    let(:search) { Search.create!(params: 'test', visitor: visitor) }
    let(:search2) { Search.create!(params: 'test', visitor: visitor) }
    let(:search3) { Search.create!(params: 'test2', visitor: visitor) }
    let(:search4) { Search.create!(params: 'test3', visitor: visitor) }
    let(:search5) { Search.create!(params: 'test4', visitor: visitor) }
    let(:search6) { Search.create!(params: 'test5', visitor: visitor) }
    




    describe "last_search_params" do
        it "returns current visitor last search params" do
            search
            search2
            search3
            search4
            search5
            search6
            expect(Search.last_search_params).to eq("test5")
        end
    end
end
    