const functions = require('firebase-functions');

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
exports.helloWorld = functions.https.onRequest((request, response) => {
	response.setHeader('Content-Type', 'application/json');

	const spks = {
		speakers: [
			{
				id: "GurolCay",
				data: {
	                name: "Mehmet Gürol Çay",
	                tags: [
	                    "Web",
	                    "Keynote"
	                ],
	                title: "Developer Relations Region Lead",
	                order: 1,
	                featured: true,
	                company: "Google",
	                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/wtm19-site.appspot.com/o/google.png?alt=media&token=29967743-e249-47f4-bf47-1184a9047c85",
	                country: "Turkey",
	                socials: [
	                    {
	                        "icon": "linkedin",
	                        "link": "https://www.linkedin.com/in/barisyesugey/",
	                        "name": "Linkedin"
	                    }
	                ],
	                bio: "Üniversite eğitimini İngiltere'de (Bilgisayar Bilimleri) tamamlayan Barış, Facebook ve Paypal'da satış ve çözüm mühendisi olarak geliştiricilerin platform teknolojilerini uygulama ve servislerine entegre etmesinde destek oldu. Şu anda, Google Ekosistem takiminda, Google Gelistirici Platform ürünlerini Türkiye, Kafkaslar ve Asya bölgeside yasayan geliştiricilere tanitmaktadir.",
	                shortBio: "Google Ekosistem takiminda, Google Gelistirici Platform ürünlerini Türkiye, Kafkaslar ve Asya bölgeside yasayan geliştiricilere tanitmaktadir.",
	                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/mehmet-gurol-cay.jpg?alt=media&token=585c3d92-5dc4-4829-8853-b3ec5492dc11"
	            }
			}, // gurol cay
			{
				id: "GokceNurErer",
				data: {
	                name: "Gökçe Nur Erer",
	                tags: [
	                    "Web",
	                    "Keynote"
	                ],
	                title: "Developer Relations Region Lead",
	                order: 1,
	                featured: true,
	                company: "Google",
	                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/wtm19-site.appspot.com/o/google.png?alt=media&token=29967743-e249-47f4-bf47-1184a9047c85",
	                country: "Turkey",
	                socials: [
	                    {
	                        "icon": "linkedin",
	                        "link": "https://www.linkedin.com/in/barisyesugey/",
	                        "name": "Linkedin"
	                    }
	                ],
	                bio: "Üniversite eğitimini İngiltere'de (Bilgisayar Bilimleri) tamamlayan Barış, Facebook ve Paypal'da satış ve çözüm mühendisi olarak geliştiricilerin platform teknolojilerini uygulama ve servislerine entegre etmesinde destek oldu. Şu anda, Google Ekosistem takiminda, Google Gelistirici Platform ürünlerini Türkiye, Kafkaslar ve Asya bölgeside yasayan geliştiricilere tanitmaktadir.",
	                shortBio: "Google Ekosistem takiminda, Google Gelistirici Platform ürünlerini Türkiye, Kafkaslar ve Asya bölgeside yasayan geliştiricilere tanitmaktadir.",
	                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/gokce-nur-erer.jpg?alt=media&token=ff30819f-40ff-4ad9-8f91-15128439a620"
	            }
			}, // gokce nur erer
			{
				id: "AhmetErgani",
				data: {
	                name: "Ahmet Ergani",
	                tags: [
	                    "Web",
	                    "Keynote"
	                ],
	                title: "Developer Relations Region Lead",
	                order: 1,
	                featured: true,
	                company: "Google",
	                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/wtm19-site.appspot.com/o/google.png?alt=media&token=29967743-e249-47f4-bf47-1184a9047c85",
	                country: "Turkey",
	                socials: [
	                    {
	                        "icon": "linkedin",
	                        "link": "https://www.linkedin.com/in/barisyesugey/",
	                        "name": "Linkedin"
	                    }
	                ],
	                bio: "Üniversite eğitimini İngiltere'de (Bilgisayar Bilimleri) tamamlayan Barış, Facebook ve Paypal'da satış ve çözüm mühendisi olarak geliştiricilerin platform teknolojilerini uygulama ve servislerine entegre etmesinde destek oldu. Şu anda, Google Ekosistem takiminda, Google Gelistirici Platform ürünlerini Türkiye, Kafkaslar ve Asya bölgeside yasayan geliştiricilere tanitmaktadir.",
	                shortBio: "Google Ekosistem takiminda, Google Gelistirici Platform ürünlerini Türkiye, Kafkaslar ve Asya bölgeside yasayan geliştiricilere tanitmaktadir.",
	                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/ahmet-ergani.jpg?alt=media&token=ef098d51-ccd4-4022-a6f3-6dbe6e87ab67"
	            }
			}, // ahmet ergani
		]
	};

	response.send(JSON.stringify(spks));
});
