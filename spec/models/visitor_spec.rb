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

        it "returns first ordered search params" do
            search
            search2
            search3
            search4
            search5
            search6
            expect(Search.searches_ordered_limited.first[:name]).to eq('test')
        end

        it "returns last ordered search params" do
            search
            search2
            search3
            search4
            search5
            search6
            expect(Search.searches_ordered_limited.last[:name]).to eq('test5')
        end

        it "returns last ordered search params" do
            search
            search2
            search3
            search4
            search5
            search6
            expect(Search.searches_ordered_limited.count).to eq(5)

        end

        it "return top 5 searches" do
            search
            search2
            search3
            search4
            search5
            search6
            expect(Search.searches_ordered_limited.count).to eq(5)
        end
     
        it "return 3rd top search" do
            search
            search2
            search3
            search4
            search5
            search6
            expect(Search.searches_ordered_limited[2][:name]).to eq('test3')
        end

        it "return 3rd top search count" do
            search
            search2
            search3
            search4
            search5
            search6
            expect(Search.searches_ordered_limited[2][:count]).to eq(1)
        end
    end
end
    