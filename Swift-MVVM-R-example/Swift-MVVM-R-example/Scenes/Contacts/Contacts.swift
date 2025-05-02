
// MARK: - Contact

struct Contact: Decodable {
  let name: String?
  let nickName: String?
  var followers: Int?
  let buttonTitleFollow: String?
  let buttonTitleUnfollow: String?
}
