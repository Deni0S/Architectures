import Foundation

struct ITunesSearchResult<Element: Codable>: Codable {
    let resultCount: Int
    let results: [Element]
}
