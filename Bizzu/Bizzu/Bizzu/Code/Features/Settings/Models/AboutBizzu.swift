//
//  AboutQuoteClub.swift
//  Bizzu
//
//  Created by Ali on 18/12/2023.
//

import Foundation

struct AboutBizzu: Hashable {
    let question: String
    let answer: String
}

extension AboutBizzu {
    static var about: [AboutBizzu] {
        [
            AboutBizzu(
                question: "Bizzu Nedir?",
                answer: "Bizzu, kullanıcılarına düşündüklerini serbestçe ifade etme özgürlüğü tanır. İster bir kısa düşünce paylaşın, ister hayatınızın bir anısını anlatın, isterse günlük ipuçlarınızı diğerleriyle paylaşın. Herkesin birbirinden öğreneceği, ilham alacağı bir ortam."
            ),
            
            AboutBizzu(
                question: "Bizzu kim tarafından geliştirildi?",
                answer: "Ali Akyıldız"
            ),
            
            AboutBizzu(
                question: "Gizlilik ve Güvenlik önlemleri var mı?",
                answer: "Kullanıcılarımızın güvenliği bizim için önemlidir. Bizzu, kullanıcı bilgilerini korumak ve güvenli bir paylaşım ortamı sağlamak için gelişmiş güvenlik önlemlerini benimser."
            ),
            
            AboutBizzu(
                question: "Bizzu hangi özellikleri sunuyor?",
                answer: """
- Paylaşımları beğenebilirsiniz.
- Paylaşımları kaydedebilirsiniz.
- Farklı kullanıcıların profili ziyaret edebilirsiniz.
- Kategorilere göre paylaşımları filtreleyebilirsiniz.
- Uygulamanın rengini kişiselleştirebilirsiniz.
- Profilinizi düzenleyebilirsiniz.

ve daha fazlası...
"""
            )
            
        ]
    }
}

extension AboutBizzu {
    static var lorem: String {
        """
Kullanım Koşulları (Terms of Service):

Hoş geldiniz! Bizzu uygulamasını kullanarak, aşağıdaki kullanım koşullarını kabul etmiş olursunuz:

Hesap Oluşturma ve Güvenlik:

Bizzu uygulamasını kullanmak için bir hesap oluşturmalısınız.
Hesap bilgilerinizin güvenliğinden kendiniz sorumlusunuz.
Hesap bilgilerinizin yetkisiz kullanımından Bizzu sorumlu değildir.
İçerik Paylaşımı:

Bizzu üzerinde paylaşılan içerikler, kullanıcılar arasında anlayış ve saygı çerçevesinde paylaşılmalıdır.
İzinsiz içerik paylaşımı veya uygunsuz davranışlar yasaktır.
Gizlilik ve Veri Kullanımı:

Gizlilik Politikamızı inceleyerek, uygulamamızın veri kullanımı hakkında bilgi edinebilirsiniz.
Kullanıcı bilgileriniz, yürürlükteki yasalar ve politikalar dahilinde işlenir.
Hesap İptali ve Kullanıcı Hakları:

Hesabınızı istediğiniz zaman kapatabilirsiniz.
Kullanıcı hakları ve gizlilik hakları ile ilgili daha fazla bilgi için Gizlilik Politikamızı kontrol edin.
Değişiklikler ve Güncellemeler:

Kullanım koşullarımız zaman zaman güncellenebilir.
Güncellemeleri takip etmek için düzenli olarak kullanım koşullarını kontrol etmelisiniz.
"""
    }
}
