module ApplicationHelper
  def default_meta_tags
    {
      site: 'アングリーカードジェネレーター',
      title: '俺のターン！ドロー！ストレスをアングリーカードとして召喚！クリックしてアングリーカードを召喚しよう！',
      reverse: true,
      separator: '|',
      description: '「アングリーカードジェネレーター」は、日常のちょっとしたストレスを、カードゲーム風に遊び心を持って昇華させるサービスです。',
      keywords: 'アングリーカードジェネレーター',
      charset: 'UTF-8',
      canonical: 'https://www.angrycard-generator.com',
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url('favicon.ico'), sizes: '32x32' }
      ],
      og: {
        site_name: 'アングリーカードジェネレーター',
        title: '俺のターン！ドロー！ストレスをアングリーカードとして召喚！クリックしてアングリーカードを召喚しよう！',
        description: '「アングリーカードジェネレーター」は、日常のちょっとしたストレスを、カードゲーム風に遊び心を持って昇華させるサービスです。',
        type: 'website',
        url: 'https://www.angrycard-generator.com',
        image: image_url("ogp2.png"),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@itomiki_hiyoko'
      }
    }
  end
end
