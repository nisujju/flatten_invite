require_relative '../flatten_array'

describe FlattenArray do 

	it "checks the nil array is flattened with nil result" do
	  empty_array = FlattenArray.flatten([])
	  expect(empty_array).to be_empty
	end	

	it "checks if the array is proper and nested than return flattened array" do
		flattened_array = FlattenArray.flatten([[1,[2,3,4],5],6,[7,8],9])
		expect(flattened_array).to eq ([1,2,3,4,5,6,7,8,9])
	end

	it "checks if array is already flattened than return the same array" do
	   already_flattened_array = FlattenArray.flatten([1,2,3,4])
	   expect(already_flattened_array).to eq ([1,2,3,4])
	end

	it "checks if flatten array is called with parameter which is other than array class than return nil" do
		string_passed = FlattenArray.flatten("string")
		expect(string_passed).to be_nil
	end


end