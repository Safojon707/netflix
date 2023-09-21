//
//  AboutViewController.swift
//  Netflix Clone
//
//  Created by Safojon Axmadov on 13/09/23.
//
import UIKit

class AboutViewController: UIViewController {

    let txt = """

The Netflix Clone with Enhanced Features is an innovative streaming platform designed to provide users with a dynamic and immersive movie-watching experience. This platform closely resembles Netflix in terms of its user interface and content library but comes with unique features to set it apart.

Key Features:

1. **Extensive Content Library:** The Netflix Clone boasts an extensive and ever-expanding library of movies, TV shows, documentaries, and exclusive content. Users can explore a wide range of genres, including action, drama, comedy, sci-fi, and more.

2. **Trailers and Teasers:** One of the standout features of this platform is its comprehensive collection of movie trailers and teasers. Users can watch previews for upcoming releases, allowing them to get a sneak peek at the latest films and series before they hit the screens.

3. **New Premieres:** The Netflix Clone is committed to delivering the latest premieres from the world of entertainment. Subscribers can access new movies on the platform shortly after their theater releases, providing a convenient and cost-effective way to enjoy the latest cinematic experiences from the comfort of their homes.

4. **Personalized Recommendations:** Utilizing advanced AI algorithms, the platform offers personalized content recommendations based on users' viewing history and preferences. This ensures that users are continually discovering new content tailored to their tastes.

5. **User Profiles:** Users can create multiple profiles under a single account, allowing family members or housemates to have their own personalized streaming experience. Each profile can have its own watchlist and viewing history.

6. **High-Quality Streaming:** The Netflix Clone offers high-definition and 4K streaming options for compatible devices, ensuring that users can enjoy their favorite content in the best possible quality.

7. **Cross-Platform Compatibility:** The platform is accessible across various devices, including smartphones, tablets, smart TVs, and desktop computers. Users can seamlessly switch between devices while retaining their watchlists and preferences.

8. **Offline Viewing:** Subscribers have the option to download content for offline viewing, making it convenient for users on the go or in areas with limited internet connectivity.

9. **User-Friendly Interface:** The platform features an intuitive and user-friendly interface, making it easy for both tech-savvy and novice users to navigate and discover content effortlessly.

10. **Affordable Subscription Plans:** The Netflix Clone offers a range of subscription plans to cater to different budget and usage preferences. Users can choose from monthly or annual plans with varying levels of access.

In summary, the Netflix Clone with Enhanced Features is a streaming platform that not only offers an extensive library of movies and TV shows but also focuses on providing users with trailers, teasers, and new premieres. With its user-friendly interface and personalized recommendations, it aims to deliver a top-tier streaming experience for movie enthusiasts of all kinds.
            <( Thank you for being with us )>

"""
    lazy var aboutTxt: UITextView = {
        

        let view = UITextView()
        view.text = txt
        view.textAlignment = .center
        view.allowsEditingTextAttributes = false
        view.textColor = .white
        view.backgroundColor = .black
        view.font = .systemFont(ofSize: 16, weight: .regular)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutTxt.isEditable = false

        view.backgroundColor = .lightGray
        
        view.addSubview(aboutTxt)
        
        aboutTxt.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
           
        }
    }
    

  
}

  

