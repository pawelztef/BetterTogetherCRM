shared_examples_for('have initialize_or_update') do
  before(:example) do
    loc_params = { line1: "xxx",
                   city: "xxx",
                   county: "xxx" }
    @params = { first_name: "xxx",
                last_name: "xxx",
                email: 'xxx',
                phone1: 'xxx',
                pnone2:  'xxx',
                institution: 'xxx',
                location:  loc_params }
  end
  it 'respond with argument' do
    expect(klass).to receive(:initialize_or_update).with(any_args)
    klass.initialize_or_update "any"
  end

  it 'returns object' do
    @params[:email] = "email"
    klass.stub(:initialize_or_update).and_return(subject)
    expect(klass.initialize_or_update(@params)).to be(subject)
  end
end
