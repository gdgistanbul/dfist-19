const functions = require('firebase-functions');
const url = require('url');

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

const seshs = {
    sessions: [
        {
            id: "101",
            data: {
                "complexity": "GDG",
                "tags": [
                    "Cloud"
                ],
                speakers: [
                    "GurolCay"
                ],
                title: "Gurol Toplanti Yapalim ;)",
                language: "Turkish",
                description: "Progressive Delivery makes it easier to adopt Continuous Delivery, by deploying new versions to a subset of users and evaluating their correctness and performance before rolling them to the totality of the users, and rolled back if not matching some key metrics. Canary deployments is one of the techniques in Progressive Delivery, used in companies like Facebook to roll out new versions gradually. But good news! you don't need to be Facebook to take advantage of it.\n\nWe will demo how to create a fully automated Progressive Delivery pipeline with Canary deployments and rollbacks in Kubernetes using Jenkins X, an open source platform for cloud native CI/CD in Kubernetes, and Flagger, a project that uses Istio and Prometheus to automate Canary rollouts and rollbacks."
            }
        },
        {
            id: "102",
            data: {
                "complexity": "GDG",
                "tags": [
                    "Cloud"
                ],
                speakers: [
                    "GokceNurErer"
                ],
                title: "Nasil Kirpi Olunur?",
                language: "English",
                description: "Progressive Delivery makes it easier to adopt Continuous Delivery, by deploying new versions to a subset of users and evaluating their correctness and performance before rolling them to the totality of the users, and rolled back if not matching some key metrics. Canary deployments is one of the techniques in Progressive Delivery, used in companies like Facebook to roll out new versions gradually. But good news! you don't need to be Facebook to take advantage of it.\n\nWe will demo how to create a fully automated Progressive Delivery pipeline with Canary deployments and rollbacks in Kubernetes using Jenkins X, an open source platform for cloud native CI/CD in Kubernetes, and Flagger, a project that uses Istio and Prometheus to automate Canary rollouts and rollbacks."
            }
        },
        {
            id: "103",
            data: {
                "complexity": "GDG",
                "tags": [
                    "Cloud"
                ],
                speakers: [
                    "AhmetErgani"
                ],
                title: "Tum Tatilde Nasil Skyrim Oynadim?",
                language: "English",
                description: "Progressive Delivery makes it easier to adopt Continuous Delivery, by deploying new versions to a subset of users and evaluating their correctness and performance before rolling them to the totality of the users, and rolled back if not matching some key metrics. Canary deployments is one of the techniques in Progressive Delivery, used in companies like Facebook to roll out new versions gradually. But good news! you don't need to be Facebook to take advantage of it.\n\nWe will demo how to create a fully automated Progressive Delivery pipeline with Canary deployments and rollbacks in Kubernetes using Jenkins X, an open source platform for cloud native CI/CD in Kubernetes, and Flagger, a project that uses Istio and Prometheus to automate Canary rollouts and rollbacks."
            }
        },
    ]
};

const sched = {
    schedule: [
        {
            id: "2016-09-09",
            data: {
                date: "2020-02-29",
                tracks: [
                    {
                        title: "Bosphorus(Uniq Hall)"
                    },
                    {
                        title: "Galata Tower(Glass Room)"
                    },
                    {
                        title: "Maiden's Tower"
                    }
                ],
                dateReadable: "February 29",
                timeslots: [
                    {
                        sessions: [
                            {
                                items: [
                                    101,
                                ]
                            },
                            {
								items: [
                                    102,
                                ]
                            },
                            {
								items: [
                                    103,
                                ]
                            },
                        ],
                        endTime: "10:00",
                        startTime: "09:00"
                    },
                ]
            }
        }
    ]
}

exports.geekday = functions.https.onRequest((req, res) => {
	const queryObject = url.parse(req.url,true).pathname;
	pathname = queryObject.slice(1);
	params = pathname.split('/');

	console.log("params are: " + params);
	console.log("params lengths is: " + params.length);

	if(params.length === 1 && params[0] === "") {
		res.setHeader('Content-Type', 'application/json');
		res.send(JSON.stringify(spks));
	}
	else if(params.length === 1 && params[0] === "sessions") {
		res.setHeader('Content-Type', 'application/json');
		res.send(JSON.stringify(seshs));
	}
	else if(params.length === 1 && params[0] === "schedule") {
		res.setHeader('Content-Type', 'application/json');
		res.send(JSON.stringify(sched));
	}
	else if(params.length === 1) {
		res.setHeader('Content-Type', 'application/json');

		var speaker_info = spks.speakers.filter(function (speaker) {
			return speaker.id === params[0];
		});

		var speaker_response_obj = {
			speakers: speaker_info
		};

		res.send(JSON.stringify(speaker_response_obj));
	}
	else if(params.length === 2 && params[1] === "sessions") {
		res.setHeader('Content-Type', 'application/json');

		var session_info = seshs.sessions.filter(function (sesh) {
			return sesh.data.speakers.includes(params[0]);
		});

		var session_response_obj = {
			sessions: session_info
		};

		res.send(JSON.stringify(session_response_obj));
	}
	else {
		res.status(404).send('Invalid Request...');
	}
});
