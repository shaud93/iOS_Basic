//
//  PokemonViewModelTests.swift
//  PokemonTests
//
//  Created by D'Ante Watson on 11/12/23.
//

import XCTest
@testable import Pokemon

@MainActor
final class PokemonViewModelTests: XCTestCase {
var pokemonViewModel:PokemonViewModel!

    override func setUpWithError() throws {
        pokemonViewModel = PokemonViewModel(network: FakeNetworkManager())
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        pokemonViewModel = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetDataFromViewModel_WhenExpectingGoodResults() async throws {
        //when
        await pokemonViewModel.getDataFromviewModel(urlString: "PokemonList")
        
        //then
        XCTAssertGreaterThan(pokemonViewModel.pokemonListArray.count, 0)
        
        let pokemon = pokemonViewModel.pokemonListArray.first
        XCTAssertEqual(pokemon?.name, "Aggron")
        XCTAssertEqual(pokemon?.hp, "140")
    }
    
    func testGetDataFromViewModel_WhenExpectingBadResults_NoUrl() async throws {
        //when
        await pokemonViewModel.getDataFromviewModel(urlString: "")
        
        //then
        XCTAssertEqual(pokemonViewModel.pokemonListArray.count, 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
