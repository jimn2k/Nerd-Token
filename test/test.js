require('chai')
    .use(require('chai-as-promised'))
    .should()

const Token = artifacts.require('NerdToken')

contract('NerdToken', ([owner, minter, pauser, holder1, holder2]) => {
    let token 
    const _name = 'NerdToken'
    const _symbol = 'NERD'

    beforeEach( async() => {
        token = await Token.new()
    })

    describe('token attributes', async() => {
        it('has an address', async() => {
            assert.notEqual(token.address, undefined)
            assert.notEqual(token.address, null)
            assert.notEqual(token.address, 0x0)
        })
        it('has the correct name', async() => {
            const name = await token.name()
            name.should.equal(_name)
        })
        it('has the correct symbol', async() => {
            const symbol = await token.symbol()
            symbol.should.equal(_symbol)
        })
    })
}) 