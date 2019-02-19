# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 外部キー制約を一時的に外して、categoriesテーブルの中身を空にしている
ActiveRecord::Base.connection.execute("set foreign_key_checks = 0;")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE categories;")
ActiveRecord::Base.connection.execute("set foreign_key_checks = 1;")
# categoriesテーブルにマスターデータを挿入している
Category.create!(name: '介護（施設）特別養護老人ホ ーム')
Category.create!(name: '介護（施設）介護老人保健施設')
Category.create!(name: '介護（施設）療養病床')
Category.create!(name: '介護（施設）老人ホーム')
Category.create!(name: '介護（施設）グループホーム')
Category.create!(name: '介護（在宅）デイサービス')
Category.create!(name: '介護（在宅）小規模多機能居宅')
Category.create!(name: '介護（在宅）訪問介護')
Category.create!(name: '介護（在宅）訪問看護')
Category.create!(name: '介護（在宅）デイケア')
Category.create!(name: '介護（在宅）居宅介護支援（ケアマネ）')
Category.create!(name: '介護（在宅）福祉用具貸与')
Category.create!(name: '障がい者福祉　訪問介護')
Category.create!(name: '障がい者福祉　行動援護、同行援護')
Category.create!(name: '障がい者福祉　療養介護')
Category.create!(name: '障がい者福祉　生活介護')
Category.create!(name: '障がい者福祉　ケアホーム、グループホーム')
Category.create!(name: '障がい者福祉　就労支援移行')
Category.create!(name: '障がい者福祉　施設入所支援')
Category.create!(name: '児童福祉　児童デイサービス等')
Category.create!(name: '医療　病院')
Category.create!(name: '医療　クリニック')
Category.create!(name: '医療　歯科医院')
Category.create!(name: '保育園')
Category.create!(name: '整骨院、マッサージ院')
Category.create!(name: '行政（自治体）')
Category.create!(name: 'その他')
