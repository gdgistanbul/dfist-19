const functions = require('firebase-functions');
const url = require('url');

const spks = {
    speakers: [
        {
            id: "DaronYondem",
            data: {
                name: "Daron Yöndem",
                tags: [
                    "None",
                ],
                title: "[TITLE]",
                order: 1,
                featured: true,
                company: "[COMPANY]",
                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/company_default.png?alt=media&token=71effa2c-c65c-4870-ac6e-c77656c1c228",
                country: "[COUNTRY]",
                socials: [
                    {
                        "icon": "linkedin",
                        "link": "",
                        "name": "Linkedin"
                    },
                    {
                        "icon": "twitter",
                        "link": "",
                        "name": "Twitter"
                    }
                ],
                bio: "[LONG_BIO]",
                shortBio: "[SHORT_BIO]",
                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/pfp_default.png?alt=media&token=2cb3d30e-f689-4204-b91d-8de6eedd90e2"
            }
        }, // Daron Yöndem
        {
            id: "HasanBurhanBeytur",
            data: {
                name: "Hasan Burhan Beytur",
                tags: [
                    "None",
                ],
                title: "[TITLE]",
                order: 1,
                featured: true,
                company: "[COMPANY]",
                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/company_default.png?alt=media&token=71effa2c-c65c-4870-ac6e-c77656c1c228",
                country: "[COUNTRY]",
                socials: [
                    {
                        "icon": "linkedin",
                        "link": "",
                        "name": "Linkedin"
                    },
                    {
                        "icon": "twitter",
                        "link": "",
                        "name": "Twitter"
                    }
                ],
                bio: "[LONG_BIO]",
                shortBio: "[SHORT_BIO]",
                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/pfp_default.png?alt=media&token=2cb3d30e-f689-4204-b91d-8de6eedd90e2"
            }
        }, // Hasan Burhan Beytur
        {
            id: "OnurYuksektepeli",
            data: {
                name: "Onur Yüksektepeli",
                tags: [
                    "None",
                ],
                title: "[TITLE]",
                order: 1,
                featured: true,
                company: "[COMPANY]",
                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/company_default.png?alt=media&token=71effa2c-c65c-4870-ac6e-c77656c1c228",
                country: "[COUNTRY]",
                socials: [
                    {
                        "icon": "linkedin",
                        "link": "",
                        "name": "Linkedin"
                    },
                    {
                        "icon": "twitter",
                        "link": "",
                        "name": "Twitter"
                    }
                ],
                bio: "[LONG_BIO]",
                shortBio: "[SHORT_BIO]",
                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/pfp_default.png?alt=media&token=2cb3d30e-f689-4204-b91d-8de6eedd90e2"
            }
        }, // Onur Yüksektepeli
        {
            id: "MustafaKara",
            data: {
                name: "Mustafa Kara",
                tags: [
                    "None",
                ],
                title: "[TITLE]",
                order: 1,
                featured: true,
                company: "[COMPANY]",
                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/company_default.png?alt=media&token=71effa2c-c65c-4870-ac6e-c77656c1c228",
                country: "[COUNTRY]",
                socials: [
                    {
                        "icon": "linkedin",
                        "link": "",
                        "name": "Linkedin"
                    },
                    {
                        "icon": "twitter",
                        "link": "",
                        "name": "Twitter"
                    }
                ],
                bio: "[LONG_BIO]",
                shortBio: "[SHORT_BIO]",
                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/pfp_default.png?alt=media&token=2cb3d30e-f689-4204-b91d-8de6eedd90e2"
            }
        }, // Mustafa Kara
        {
            id: "MursidYazar",
            data: {
                name: "Mürşid Yazar",
                tags: [
                    "None",
                ],
                title: "[TITLE]",
                order: 1,
                featured: true,
                company: "[COMPANY]",
                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/company_default.png?alt=media&token=71effa2c-c65c-4870-ac6e-c77656c1c228",
                country: "[COUNTRY]",
                socials: [
                    {
                        "icon": "linkedin",
                        "link": "",
                        "name": "Linkedin"
                    },
                    {
                        "icon": "twitter",
                        "link": "",
                        "name": "Twitter"
                    }
                ],
                bio: "[LONG_BIO]",
                shortBio: "[SHORT_BIO]",
                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/pfp_default.png?alt=media&token=2cb3d30e-f689-4204-b91d-8de6eedd90e2"
            }
        }, // Mürşid Yazar
        {
            id: "YigitOzaksut",
            data: {
                name: "Yiğit Özaksüt",
                tags: [
                    "None",
                ],
                title: "[TITLE]",
                order: 1,
                featured: true,
                company: "[COMPANY]",
                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/company_default.png?alt=media&token=71effa2c-c65c-4870-ac6e-c77656c1c228",
                country: "[COUNTRY]",
                socials: [
                    {
                        "icon": "linkedin",
                        "link": "",
                        "name": "Linkedin"
                    },
                    {
                        "icon": "twitter",
                        "link": "",
                        "name": "Twitter"
                    }
                ],
                bio: "[LONG_BIO]",
                shortBio: "[SHORT_BIO]",
                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/pfp_default.png?alt=media&token=2cb3d30e-f689-4204-b91d-8de6eedd90e2"
            }
        }, // Yiğit Özaksüt
        {
            id: "FurkanKamaci",
            data: {
                name: "Furkan Kamacı",
                tags: [
                    "None",
                ],
                title: "[TITLE]",
                order: 1,
                featured: true,
                company: "[COMPANY]",
                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/company_default.png?alt=media&token=71effa2c-c65c-4870-ac6e-c77656c1c228",
                country: "[COUNTRY]",
                socials: [
                    {
                        "icon": "linkedin",
                        "link": "",
                        "name": "Linkedin"
                    },
                    {
                        "icon": "twitter",
                        "link": "",
                        "name": "Twitter"
                    }
                ],
                bio: "[LONG_BIO]",
                shortBio: "[SHORT_BIO]",
                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/pfp_default.png?alt=media&token=2cb3d30e-f689-4204-b91d-8de6eedd90e2"
            }
        }, // Furkan Kamacı
        {
            id: "AlaaAlnuaimi",
            data: {
                name: "Alaa Alnuaimi",
                tags: [
                    "None",
                ],
                title: "[TITLE]",
                order: 1,
                featured: true,
                company: "[COMPANY]",
                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/company_default.png?alt=media&token=71effa2c-c65c-4870-ac6e-c77656c1c228",
                country: "[COUNTRY]",
                socials: [
                    {
                        "icon": "linkedin",
                        "link": "",
                        "name": "Linkedin"
                    },
                    {
                        "icon": "twitter",
                        "link": "",
                        "name": "Twitter"
                    }
                ],
                bio: "[LONG_BIO]",
                shortBio: "[SHORT_BIO]",
                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/pfp_default.png?alt=media&token=2cb3d30e-f689-4204-b91d-8de6eedd90e2"
            }
        }, // Alaa Alnuaimi
        {
            id: "DmitryGalov",
            data: {
                name: "Dmitry Galov",
                tags: [
                    "None",
                ],
                title: "[TITLE]",
                order: 1,
                featured: true,
                company: "[COMPANY]",
                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/company_default.png?alt=media&token=71effa2c-c65c-4870-ac6e-c77656c1c228",
                country: "[COUNTRY]",
                socials: [
                    {
                        "icon": "linkedin",
                        "link": "",
                        "name": "Linkedin"
                    },
                    {
                        "icon": "twitter",
                        "link": "",
                        "name": "Twitter"
                    }
                ],
                bio: "[LONG_BIO]",
                shortBio: "[SHORT_BIO]",
                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/pfp_default.png?alt=media&token=2cb3d30e-f689-4204-b91d-8de6eedd90e2"
            }
        }, // Dmitry Galov
        {
            id: "GurayYildirim",
            data: {
                name: "Güray Yıldırım",
                tags: [
                    "None",
                ],
                title: "[TITLE]",
                order: 1,
                featured: true,
                company: "[COMPANY]",
                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/company_default.png?alt=media&token=71effa2c-c65c-4870-ac6e-c77656c1c228",
                country: "[COUNTRY]",
                socials: [
                    {
                        "icon": "linkedin",
                        "link": "",
                        "name": "Linkedin"
                    },
                    {
                        "icon": "twitter",
                        "link": "",
                        "name": "Twitter"
                    }
                ],
                bio: "[LONG_BIO]",
                shortBio: "[SHORT_BIO]",
                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/pfp_default.png?alt=media&token=2cb3d30e-f689-4204-b91d-8de6eedd90e2"
            }
        }, // Güray Yıldırım
        {
            id: "UgurTilikoglu",
            data: {
                name: "Uğur Tılıkoğlu",
                tags: [
                    "None",
                ],
                title: "[TITLE]",
                order: 1,
                featured: true,
                company: "[COMPANY]",
                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/company_default.png?alt=media&token=71effa2c-c65c-4870-ac6e-c77656c1c228",
                country: "[COUNTRY]",
                socials: [
                    {
                        "icon": "linkedin",
                        "link": "",
                        "name": "Linkedin"
                    },
                    {
                        "icon": "twitter",
                        "link": "",
                        "name": "Twitter"
                    }
                ],
                bio: "[LONG_BIO]",
                shortBio: "[SHORT_BIO]",
                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/pfp_default.png?alt=media&token=2cb3d30e-f689-4204-b91d-8de6eedd90e2"
            }
        }, // Uğur Tılıkoğlu
        {
            id: "SercanYusuf",
            data: {
                name: "Sercan Yusuf",
                tags: [
                    "None",
                ],
                title: "[TITLE]",
                order: 1,
                featured: true,
                company: "[COMPANY]",
                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/company_default.png?alt=media&token=71effa2c-c65c-4870-ac6e-c77656c1c228",
                country: "[COUNTRY]",
                socials: [
                    {
                        "icon": "linkedin",
                        "link": "",
                        "name": "Linkedin"
                    },
                    {
                        "icon": "twitter",
                        "link": "",
                        "name": "Twitter"
                    }
                ],
                bio: "[LONG_BIO]",
                shortBio: "[SHORT_BIO]",
                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/pfp_default.png?alt=media&token=2cb3d30e-f689-4204-b91d-8de6eedd90e2"
            }
        }, // Sercan Yusuf
        {
            id: "EbruGuven",
            data: {
                name: "Ebru Güven",
                tags: [
                    "None",
                ],
                title: "[TITLE]",
                order: 1,
                featured: true,
                company: "[COMPANY]",
                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/company_default.png?alt=media&token=71effa2c-c65c-4870-ac6e-c77656c1c228",
                country: "[COUNTRY]",
                socials: [
                    {
                        "icon": "linkedin",
                        "link": "",
                        "name": "Linkedin"
                    },
                    {
                        "icon": "twitter",
                        "link": "",
                        "name": "Twitter"
                    }
                ],
                bio: "[LONG_BIO]",
                shortBio: "[SHORT_BIO]",
                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/pfp_default.png?alt=media&token=2cb3d30e-f689-4204-b91d-8de6eedd90e2"
            }
        }, // Ebru Güven
        {
            id: "BasakBurcuYigit",
            data: {
                name: "Başak Burcu Yiğit",
                tags: [
                    "None",
                ],
                title: "[TITLE]",
                order: 1,
                featured: true,
                company: "[COMPANY]",
                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/company_default.png?alt=media&token=71effa2c-c65c-4870-ac6e-c77656c1c228",
                country: "[COUNTRY]",
                socials: [
                    {
                        "icon": "linkedin",
                        "link": "",
                        "name": "Linkedin"
                    },
                    {
                        "icon": "twitter",
                        "link": "",
                        "name": "Twitter"
                    }
                ],
                bio: "[LONG_BIO]",
                shortBio: "[SHORT_BIO]",
                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/pfp_default.png?alt=media&token=2cb3d30e-f689-4204-b91d-8de6eedd90e2"
            }
        }, // Başak Burcu Yiğit
        {
            id: "AlperGercek",
            data: {
                name: "Alper Gerçek",
                tags: [
                    "None",
                ],
                title: "[TITLE]",
                order: 1,
                featured: true,
                company: "[COMPANY]",
                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/company_default.png?alt=media&token=71effa2c-c65c-4870-ac6e-c77656c1c228",
                country: "[COUNTRY]",
                socials: [
                    {
                        "icon": "linkedin",
                        "link": "",
                        "name": "Linkedin"
                    },
                    {
                        "icon": "twitter",
                        "link": "",
                        "name": "Twitter"
                    }
                ],
                bio: "[LONG_BIO]",
                shortBio: "[SHORT_BIO]",
                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/pfp_default.png?alt=media&token=2cb3d30e-f689-4204-b91d-8de6eedd90e2"
            }
        }, // Alper Gerçek
        {
            id: "CanSungur",
            data: {
                name: "Can Sungur",
                tags: [
                    "None",
                ],
                title: "[TITLE]",
                order: 1,
                featured: true,
                company: "[COMPANY]",
                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/company_default.png?alt=media&token=71effa2c-c65c-4870-ac6e-c77656c1c228",
                country: "[COUNTRY]",
                socials: [
                    {
                        "icon": "linkedin",
                        "link": "",
                        "name": "Linkedin"
                    },
                    {
                        "icon": "twitter",
                        "link": "",
                        "name": "Twitter"
                    }
                ],
                bio: "[LONG_BIO]",
                shortBio: "[SHORT_BIO]",
                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/pfp_default.png?alt=media&token=2cb3d30e-f689-4204-b91d-8de6eedd90e2"
            }
        }, // Can Sungur
        {
            id: "ArdaArican",
            data: {
                name: "Arda Arıcan",
                tags: [
                    "None",
                ],
                title: "[TITLE]",
                order: 1,
                featured: true,
                company: "[COMPANY]",
                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/company_default.png?alt=media&token=71effa2c-c65c-4870-ac6e-c77656c1c228",
                country: "[COUNTRY]",
                socials: [
                    {
                        "icon": "linkedin",
                        "link": "",
                        "name": "Linkedin"
                    },
                    {
                        "icon": "twitter",
                        "link": "",
                        "name": "Twitter"
                    }
                ],
                bio: "[LONG_BIO]",
                shortBio: "[SHORT_BIO]",
                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/pfp_default.png?alt=media&token=2cb3d30e-f689-4204-b91d-8de6eedd90e2"
            }
        }, // Arda Arıcan
        {
            id: "OrcunKilic",
            data: {
                name: "Orçun Kılıç",
                tags: [
                    "None",
                ],
                title: "[TITLE]",
                order: 1,
                featured: true,
                company: "[COMPANY]",
                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/company_default.png?alt=media&token=71effa2c-c65c-4870-ac6e-c77656c1c228",
                country: "[COUNTRY]",
                socials: [
                    {
                        "icon": "linkedin",
                        "link": "",
                        "name": "Linkedin"
                    },
                    {
                        "icon": "twitter",
                        "link": "",
                        "name": "Twitter"
                    }
                ],
                bio: "[LONG_BIO]",
                shortBio: "[SHORT_BIO]",
                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/pfp_default.png?alt=media&token=2cb3d30e-f689-4204-b91d-8de6eedd90e2"
            }
        }, // Orçun Kılıç
        {
            id: "CanerYildirim",
            data: {
                name: "Caner Yıldırım",
                tags: [
                    "None",
                ],
                title: "[TITLE]",
                order: 1,
                featured: true,
                company: "[COMPANY]",
                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/company_default.png?alt=media&token=71effa2c-c65c-4870-ac6e-c77656c1c228",
                country: "[COUNTRY]",
                socials: [
                    {
                        "icon": "linkedin",
                        "link": "",
                        "name": "Linkedin"
                    },
                    {
                        "icon": "twitter",
                        "link": "",
                        "name": "Twitter"
                    }
                ],
                bio: "[LONG_BIO]",
                shortBio: "[SHORT_BIO]",
                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/pfp_default.png?alt=media&token=2cb3d30e-f689-4204-b91d-8de6eedd90e2"
            }
        }, // Caner Yıldırım
        {
            id: "RoySimkes",
            data: {
                name: "Roy Simkeş",
                tags: [
                    "None",
                ],
                title: "[TITLE]",
                order: 1,
                featured: true,
                company: "[COMPANY]",
                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/company_default.png?alt=media&token=71effa2c-c65c-4870-ac6e-c77656c1c228",
                country: "[COUNTRY]",
                socials: [
                    {
                        "icon": "linkedin",
                        "link": "",
                        "name": "Linkedin"
                    },
                    {
                        "icon": "twitter",
                        "link": "",
                        "name": "Twitter"
                    }
                ],
                bio: "[LONG_BIO]",
                shortBio: "[SHORT_BIO]",
                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/pfp_default.png?alt=media&token=2cb3d30e-f689-4204-b91d-8de6eedd90e2"
            }
        }, // Roy Simkeş
        {
            id: "DEBUG_SPEAKER",
            data: {
                name: "DEBUG_SPEAKER",
                tags: [
                    "None",
                ],
                title: "[TITLE]",
                order: 1,
                featured: true,
                company: "[COMPANY]",
                companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/company_default.png?alt=media&token=71effa2c-c65c-4870-ac6e-c77656c1c228",
                country: "[COUNTRY]",
                socials: [
                    {
                        "icon": "linkedin",
                        "link": "",
                        "name": "Linkedin"
                    },
                    {
                        "icon": "twitter",
                        "link": "",
                        "name": "Twitter"
                    }
                ],
                bio: "[LONG_BIO]",
                shortBio: "[SHORT_BIO]",
                photoUrl: "https://firebasestorage.googleapis.com/v0/b/geekday-mobile.appspot.com/o/pfp_default.png?alt=media&token=2cb3d30e-f689-4204-b91d-8de6eedd90e2"
            }
        }, // DEBUG (DONT REMOVE UNLESS YOU ASKED YASIR)
    ]
};

const seshs = {
    sessions: [
    	{
            id: "888",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Keynote"
                ],
                speakers: [
                    "DEBUG_SPEAKER"
                ],
                title: "Açılış Konuşması",
                language: "Turkish",
                description: "[SESSION_DESCRIPTION]"
            }
        },
        {
            id: "101",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Diğer"
                ],
                speakers: [
                    "DEBUG_SPEAKER"
                ],
                title: "[HAVELSAN]",
                language: "Turkish",
                description: "[SESSION_DESCRIPTION]"
            }
        },
        {
            id: "102",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Web Teknolojileri"
                ],
                speakers: [
                    "AlaaAlnuaimi"
                ],
                title: "React Native İle Mobil Uygulama",
                language: "Turkish",
                description: "[SESSION_DESCRIPTION]"
            }
        },
        {
            id: "103",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Diğer"
                ],
                speakers: [
                    "DEBUG_SPEAKER"
                ],
                title: "[INTERTECH]",
                language: "Turkish",
                description: "[SESSION_DESCRIPTION]"
            }
        },
        {
            id: "104",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Web Teknolojileri"
                ],
                speakers: [
                    "DaronYondem"
                ],
                title: "Serverless İle Tek Kişilik Startup'a Nitro Etkisi",
                language: "Turkish",
                description: "[SESSION_DESCRIPTION]"
            }
        },
        {
            id: "105",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Diğer"
                ],
                speakers: [
                    "DEBUG_SPEAKER"
                ],
                title: "[HAVELSAN]",
                language: "Turkish",
                description: "[SESSION_DESCRIPTION]"
            }
        },
        {
            id: "106",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Blockchain"
                ],
                speakers: [
                    "EbruGuven",
                    "BasakBurcuYigit"
                ],
                title: "Bitcoin ve Blockzincir",
                language: "Turkish",
                description: "[SESSION_DESCRIPTION]"
            }
        },
        {
            id: "107",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Diğer"
                ],
                speakers: [
                    "HasanBurhanBeytur"
                ],
                title: "Bilgi Yaşı Metriği ve IOT",
                language: "Turkish",
                description: "[SESSION_DESCRIPTION]"
            }
        },
        {
            id: "108",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Siber Güvenlik"
                ],
                speakers: [
                    "DmitryGalov"
                ],
                title: "[KASPERSKY]",
                language: "English",
                description: "[SESSION_DESCRIPTION]"
            }
        },
        {
            id: "109",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Diğer"
                ],
                speakers: [
                    "AlperGercek"
                ],
                title: "Dijital Dönüşüm",
                language: "Turkish",
                description: "[SESSION_DESCRIPTION]"
            }
        },
        {
            id: "110",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Yapay Zeka"
                ],
                speakers: [
                    "OnurYuksektepeli",
                    "MustafaKara"
                ],
                title: "Microsoft Yapay Zeka Servisleri İş Başında",
                language: "Turkish",
                description: "[SESSION_DESCRIPTION]"
            }
        },
        {
            id: "111",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Google Teknolojileri"
                ],
                speakers: [
                    "GurayYildirim"
                ],
                title: "Kubernetes Nedir, Ne İşe Yarar?",
                language: "Turkish",
                description: "[SESSION_DESCRIPTION]"
            }
        },
        {
            id: "112",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Oyun Geliştirme"
                ],
                speakers: [
                    "CanSungur"
                ],
                title: "Oyun Dizaynı Üzerine",
                language: "Turkish",
                description: "[SESSION_DESCRIPTION]"
            }
        },
        {
            id: "113",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Mobil Teknolojileri"
                ],
                speakers: [
                    "MursidYazar"
                ],
                title: "Güncel Mobil Teknolojiler ve Geleceği",
                language: "Turkish",
                description: "[SESSION_DESCRIPTION]"
            }
        },
        {
            id: "114",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Diğer"
                ],
                speakers: [
                    "DEBUG_SPEAKER",
                ],
                title: "[UNKNOWN]",
                language: "Turkish",
                description: "[SESSION_DESCRIPTION]"
            }
        },
        {
            id: "115",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Tasarım"
                ],
                speakers: [
                    "OrcunKilic",
                    "ArdaArican"
                ],
                title: "ALGI",
                language: "Turkish",
                description: "[SESSION_DESCRIPTION]"
            }
        },
        {
            id: "116",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Mobil Teknolojileri"
                ],
                speakers: [
                    "YigitOzaksut"
                ],
                title: "How To Make An Amazing App With Cognitive Services",
                language: "English",
                description: "[SESSION_DESCRIPTION]"
            }
        },
        {
            id: "117",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Oyun Geliştirme"
                ],
                speakers: [
                    "UgurTilikoglu"
                ],
                title: "Yazılım Sektöründen Oyun Sektörüne Geçen Yöneticinin Hatıraları",
                language: "Turkish",
                description: "[SESSION_DESCRIPTION]"
            }
        },
        {
            id: "118",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Tasarım"
                ],
                speakers: [
                    "CanerYildirim"
                ],
                title: "Design Systems",
                language: "Turkish",
                description: "[SESSION_DESCRIPTION]"
            }
        },
        {
            id: "119",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Yapay Zeka"
                ],
                speakers: [
                    "FurkanKamaci"
                ],
                title: "Makine Öğrenmesi",
                language: "Turkish",
                description: "[SESSION_DESCRIPTION]"
            }
        },
        {
            id: "120",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Mobil Teknolojileri",
                    "Google Teknolojileri"
                ],
                speakers: [
                    "SercanYusuf"
                ],
                title: "Zero To One With Flutter",
                language: "Turkish",
                description: "[SESSION_DESCRIPTION]"
            }
        },
        {
            id: "121",
            data: {
                "complexity": "Beginner",
                "tags": [
                    "Diğer",
                ],
                speakers: [
                    "RoySimkes"
                ],
                title: "Yazılımcılığı Nerede Öğrendim?",
                language: "Turkish",
                description: "[SESSION_DESCRIPTION]"
            }
        }
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
                        title: "Salon 1"
                    },
                    {
                        title: "Salon 2"
                    },
                    {
                        title: "Salon 3"
                    }
                ],
                dateReadable: "February 29",
                timeslots: [
                    {
                        sessions: [
                            {
                                items: [
                                    888,
                                ]
                            }
                        ],
                        endTime: "09:30",
                        startTime: "10:20"
                    },
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
                        endTime: "10:30",
                        startTime: "11:20"
                    },
                    {
                        sessions: [
                            {
                                items: [
                                    104,
                                ]
                            },
                            {
								items: [
                                    105,
                                ]
                            },
                            {
								items: [
                                    106,
                                ]
                            },
                        ],
                        endTime: "11:30",
                        startTime: "12:20"
                    },
                    {
                        sessions: [
                            {
                                items: [
                                    107,
                                ]
                            },
                            {
								items: [
                                    108,
                                ]
                            },
                            {
								items: [
                                    109,
                                ]
                            },
                        ],
                        endTime: "12:30",
                        startTime: "13:20"
                    },
                    {
                        sessions: [
                            {
                                items: [
                                    110,
                                ]
                            },
                            {
								items: [
                                    111,
                                ]
                            },
                            {
								items: [
                                    112,
                                ]
                            },
                        ],
                        endTime: "14:00",
                        startTime: "14:50"
                    },
                    {
                        sessions: [
                            {
                                items: [
                                    113,
                                ]
                            },
                            {
								items: [
                                    114,
                                ]
                            },
                            {
								items: [
                                    115,
                                ]
                            },
                        ],
                        endTime: "15:00",
                        startTime: "15:50"
                    },
                    {
                        sessions: [
                            {
                                items: [
                                    116,
                                ]
                            },
                            {
								items: [
                                    117,
                                ]
                            },
                            {
								items: [
                                    118,
                                ]
                            },
                        ],
                        endTime: "16:00",
                        startTime: "16:50"
                    },
                    {
                        sessions: [
                            {
                                items: [
                                    119,
                                ]
                            },
                            {
								items: [
                                    120,
                                ]
                            },
                            {
								items: [
                                    121,
                                ]
                            },
                        ],
                        endTime: "17:00",
                        startTime: "17:50"
                    }
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
