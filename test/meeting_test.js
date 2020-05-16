const Meeting = artifacts.require('Meeting');

contract('Meeting', accounts => {
  console.log(accounts);

  it("should add description of meeting", () =>
    Meeting.deployed()
      .then(instance => instance.addDescription('Interview'))
  );

  it("should register member", () =>
    Meeting.deployed()
      .then(instance => instance.registerMember('1234123456'))
  );

  it("should verify member registration", () =>
    Meeting.deployed()
      .then(instance => instance.verifyMemberRegistration('1234123456'))
      .then(registrationResult => assert.isOk(registrationResult, 'Member should be registered'))
  )
});