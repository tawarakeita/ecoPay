import Image from 'next/image';
import Link from 'next/link';
import QAAccordion from './QAAccordion';

export default function Page() {
  return (
    <>
      <div className='relative mt-20 p-[3%]'>
        <div className='absolute top-[5%] right-[10%] w-1/4'>
          <Image
            src="ohnan_book_store/speech_bubble.svg"
            alt=''
            width={400}
            height={100}
          />
        </div>
        <div className="relative w-3/4 m-auto">
          <Image
            src="ohnan_book_store/title.svg"
            alt="エコな購入でポイントゲット！"
            width={1200}
            height={800}
          />
        </div>
        <span className='text-2xl mt-15 flex justify-center'>CO2削減になる取り組みでポイントゲット！ポイントをPayPayポイントに交換！</span>
      </div>
      <div className='m-[20%] mt-15 mb-0'>
        <div className='text-xl bg-green-800 rounded-xl p-3 mt-10 text-white'>日時</div>
        <div className='mt-6'>
          <span>
            <span className="text-6xl mr-2">3.29</span>
            <span className='text-3xl'>sun</span>
            <span className='ml-3'>※PayPayポイントコードがなくなり次第終了</span>
          </span>
        </div>
      </div>
      <div className='m-[20%] mt-15 mb-0'>
        <div className='text-xl bg-green-800 rounded-xl p-3 mt-10 text-white'>場所</div>
        <div className='mt-6 flex'>
          <div className='w-[50%] pr-5'>
            <iframe
            title="あすな書店地図"
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d681.7092922071904!2d132.61735231439525!3d34.869042443258714!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35509f003a1d3961%3A0xee3a7700f859e9a1!2z44GC44GZ44Gq5pu45bqX!5e0!3m2!1sja!2sjp!4v1774605496174!5m2!1sja!2sjp"
              width="100%"
              height="450"
              allowFullScreen
              loading="lazy"
              referrerPolicy="no-referrer-when-downgrade"
            ></iframe>
          </div>
          <div className='w-[50%] pl-5'>
            <iframe
              title="エブリブックストア地図"
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d681.7092922071904!2d132.61735231439525!3d34.869042443258714!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35509f004f068f75%3A0x83c5cf6cbb04cae0!2z44Ko44OW44Oq44OW44OD44Kv44K544OI44Ki!5e0!3m2!1sja!2sjp!4v1774605121580!5m2!1sja!2sjp"
              width="100%"
              height="450"
              allowFullScreen
              loading="lazy"
              referrerPolicy="no-referrer-when-downgrade"
            ></iframe>
          </div>
        </div>
      </div>
      <div className='m-[20%] mt-15 mb-0'>
        <div className='text-xl bg-green-800 rounded-xl p-3 mt-10 text-white'>参加方法</div>
        <div className='mt-6 flex flex-col items-center gap-6'>
          <div className='w-3/4 h-50 p-5 border-green-800 border-2 rounded-xl'>
            <div className='flex items-center gap-2 mb-3'>
              <div className='bg-green-800 w-8 h-8 rounded-full flex items-center justify-center text-white'>
                <span>1</span>
              </div>
              <span className='text-xl'>アカウントを登録する</span>
            </div>
            <div className='flex flex-col'>
              <span className='mb-2'>メールアドレスとパスワードをを設定します。仮登録後、設定されたメールアドレス宛に本登録用のリンクが送信されます。</span>
              <a href="" className='text-blue-800 underline'>アカウント登録はこちら</a>
            </div>
          </div>
          <Image src="kisuki_line/polygon.svg" alt="" width={150} height={200}></Image>
          <div className='w-3/4 h-50 p-5 border-green-800 border-2 rounded-xl'>
            <div className='flex items-center gap-2 mb-3'>
              <div className='bg-green-800 w-8 h-8 rounded-full flex items-center justify-center text-white'>
                <span>2</span>
              </div>
              <span className='text-xl'>あすな書店 または エブリブックストアで古本を購入する</span>
            </div>
            <div className='flex flex-col'>
              <span className='mb-2'>
                あすな書店 または エブリブックストアで古本を購入してください。購入時ご案内させていただきます。<br />
                新刊、その他商品は対応できません。ご了承ください。
              </span>
            </div>
          </div>
          <Image src="kisuki_line/polygon.svg" alt="" width={150} height={200}></Image>
          <div className='w-3/4 h-50 p-5 border-green-800 border-2 rounded-xl'>
            <div className='flex items-center gap-2 mb-3'>
              <div className='bg-green-800 w-8 h-8 rounded-full flex items-center justify-center text-white'>
                <span>4</span>
              </div>
              <span className='text-xl'>PayPayポイントに交換<span className='text-sm'> ※1</span></span>
            </div>
            <div className='flex flex-col'>
              <span>
                ポイント取得されてから数日以内に担当者から古本を購入した回数のポイントコードが送信されます。また、ポイントの有効期限は2026/3/31までですので、ご注意ください。<br />
                （送信されたポイントコードの数が異なる等の不具合がありましたら、お手数ですが、ご連絡お願いします。）
              </span>
            </div>
          </div>
        </div>
      </div>
      <div className='m-[20%] mt-15 mb-0'>
        <div className='text-xl bg-green-800 rounded-xl p-3 mt-10 text-white'>古本購入でエコになる理由</div>
        <div className='mt-6 flex flex-col gap-8'>
          <div>
            <div className='flex items-center gap-2 mb-3'>
              <span className='text-xl'>寄付された古本購入でECO</span>
            </div>
            <div className='flex flex-col'>
              <span className='mb-2'>古本をゴミとして捨ててしまうと、輸送費や処理施設などの電気などでCO2が排出されますが、古本を寄付すると、捨ててしまった場合の排出量の分を削減したと言えます。</span>
            </div>
          </div>
          <div>
            <div className='flex items-center gap-2 mb-3'>
              <span className='text-xl'>新刊よりもECO</span>
            </div>
            <div className='flex flex-col'>
              <span className='mb-2'>新刊で購入すると、製造でCO2が排出されますが、古本で購入すると、2度使うことになるので、余計にCO2を排出しません。</span>
            </div>
          </div>
        </div>
      </div>
      <div className='m-[20%] mt-15 mb-0'>
        <div className='text-xl bg-green-800 rounded-xl p-3 mt-10 text-white'>アプリの使い方</div>
        <div className='mt-6'>
          <div className='m-8 ml-0'>
            <div className='w-55 h-10 flex items-center justify-center bg-green-700 rounded-xs mb-2'>
              <Link href="https://ecopay.kei-apps.com" className='text-xl text-white'>アプリはこちら</Link>
            </div>
            <span>※アプリのインストールは不要です。アカウント登録が必要です。</span>
          </div>
          <div>
            <div className='flex items-center gap-2 mb-3'>
              <span className='text-xl'>アカウント新規作成方法</span>
            </div>
            <div className='flex flex-col'>
              <span className='mb-10'>
                <a href="" className='text-blue-800 underline'>アカウント新規作成ページ</a>
                で、メールアドレス・パスワードを設定して、仮登録を行います。仮登録後、設定されたメールアドレス宛に本登録用のリンクが送信されますので、メール内のURLにアクセスして本登録を完了して、ログインをしてください。メールが届かない場合、迷惑メールフォルダ等に振り分けられていないかご確認ください。（メールは次のアドレスから送信されます。keitatawara12@icloud.com）
              </span>
            </div>
            <Image src="kisuki_line/create_account_flow.svg" alt="アカウント新規作成方法" className='w-full p-5 pt-0' width={150} height={200}></Image>
          </div>
          <div>
            <div className='flex items-center gap-2 mb-3 mt-10'>
              <span className='text-xl'>ポイント取得方法</span>
            </div>
            <div className='flex flex-col'>
              <span className='mb-10'>
                古本を購入したら、スタッフがお声かけさせていただきます。タブレットに表示されたQRコードをスキャンし、ポイント取得を行なってください。新刊、その他商品は対応できません。ご了承ください。ポイント取得されてから数日以内に担当者から古本を購入した回数のポイントコードが送信されます。また、ポイントの有効期限は2026/3/31までですので、ご注意ください。
              </span>
            </div>
            <Image src="kisuki_line/get_point_flow.svg" alt="ポイント取得方法" className='w-full p-5 pt-0' width={150} height={200}></Image>
          </div>
        </div>
      </div>
      <div className='m-[20%] mt-15 mb-0'>
        <div className='text-xl bg-green-800 rounded-xl p-3 mt-10 text-white'>ecoPayとは</div>
        <div className='mt-6'>
          <span>
            ecoPayは、CO2削減になる取り組みを行うとポイントが発行され、そのポイントを実際に利用できるようにし、CO2排出量削減をめざしています。<br />
            気候変動などに関心が薄い人でも、ポイントがもらえることで、CO2削減になる取り組みを行うきっかけになればと思っています。<br />
          </span>
        </div>
      </div>
      <div className='m-[20%] mt-15 mb-0'>
        <div className='text-xl bg-green-800 rounded-xl p-3 mt-10 text-white'>Q&A</div>
        <div className='mt-6'>
          <QAAccordion
            items={[
              { q: 'PayPayポイントはいつもらえますか？', a: 'ecoPayポイント取得後、数日以内に担当者からポイントコードが送信されます。' },
              { q: 'PayPayポイントの有効期限は？', a: 'PayPayポイントの有効期限は2026/3/31までです。' },
            ]}
          />
        </div>
      </div>
      <div className='m-[20%] mt-15 mb-0'>
        <div className='text-xl bg-green-800 rounded-xl p-3 mt-10 text-white'>開催情報</div>
        <div className='mt-6 flex'>
          <div>
            <div className='flex items-center gap-2 mb-3'>
              <span className='text-xl'>主催</span>
            </div>
            <div className='flex flex-col'>
              <span className='mb-10'>
                ecoPayプロジェクト 俵恵太（しまね未来共創チャレンジ4期生）
              </span>
            </div>
          </div>
          <div className='ml-5'>
            <div className='flex items-center gap-2 mb-3'>
              <span className='text-xl'>お問い合わせ</span>
            </div>
            <div className='flex flex-col'>
              <span className='mb-10'>
                keita_tawara@icloud.com または 090-4905-0102（俵）
              </span>
            </div>
          </div>
        </div>
      </div>
      <div className='m-[20%] mt-20 mb-5 flex flex-col gap-3'>
        <span>※1 PayPayポイントの購入は一般財団法人 地域教育魅力化プラットフォームによって行われています。また、1回のクリアにつき、1つのPayPayポイントとなります。</span>
        <span>
          ※PayPayポイントは出金、譲渡不可です。PayPay／PayPayカード公式ストアでも利用可能です。<br />
          ※PayPay、PayPayのロゴ、Pのロゴ、PayPayポイント、PayPayポイントのロゴは、PayPay株式会社の登録商標または商標です。
        </span>
        <span>※QRコードは株式会社デンソーウェーブの登録商標です。</span>
      </div>
    </>
  );
}
