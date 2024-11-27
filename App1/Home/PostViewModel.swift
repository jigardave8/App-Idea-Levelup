//
//  PostViewModel.swift
//  LevelUp
//
//  Created by BitDegree on 27/11/24.
//

//import FirebaseFirestore
//
//class PostViewModel: ObservableObject {
//    @Published var posts: [Post] = []
//    private var db = Firestore.firestore()
//
//    func fetchPosts() {
//        db.collection("posts").order(by: "date", descending: true).addSnapshotListener { snapshot, error in
//            guard let documents = snapshot?.documents else {
//                print("No documents: \(error?.localizedDescription ?? "Unknown error")")
//                return
//            }
//            self.posts = documents.compactMap { doc -> Post? in
//                let data = doc.data()
//                guard let author = data["author"] as? String,
//                      let content = data["content"] as? String,
//                      let likes = data["likes"] as? Int,
//                      let comments = data["comments"] as? [String],
//                      let date = (data["date"] as? Timestamp)?.dateValue() else { return nil }
//                return Post(author: author, content: content, likes: likes, comments: comments, date: date)
//            }
//        }
//    }
//
//    func addPost(_ post: Post) {
//        db.collection("posts").addDocument(data: [
//            "author": post.author,
//            "content": post.content,
//            "likes": post.likes,
//            "comments": post.comments,
//            "date": post.date
//        ]) { error in
//            if let error = error {
//                print("Error adding document: \(error)")
//            }
//        }
//    }
//}
