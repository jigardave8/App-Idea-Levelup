//
//  HomePageViewModel.swift
//  LevelUp
//
//  Created by BitDegree on 27/11/24.
//

import Firebase

class HomePageViewModel: ObservableObject {
    @Published var posts: [Post] = []

    private let db = Firestore.firestore()

    func fetchPosts() {
        db.collection("posts").order(by: "date", descending: true).addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            self.posts = documents.compactMap { document -> Post? in
                let data = document.data()
                guard
                    let author = data["author"] as? String,
                    let content = data["content"] as? String,
                    let likes = data["likes"] as? Int,
                    let date = (data["date"] as? Timestamp)?.dateValue()
                else { return nil }
                return Post(author: author, content: content, likes: likes, comments: [], date: date)
            }
        }
    }

    func addPost(content: String) {
        let newPost = [
            "author": "User",
            "content": content,
            "likes": 0,
            "date": Timestamp(date: Date())
        ] as [String: Any]
        db.collection("posts").addDocument(data: newPost) { error in
            if let error = error {
                print("Error adding document: \(error)")
            }
        }
    }
}
