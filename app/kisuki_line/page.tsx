import Image from 'next/image';
import Link from 'next/link';
import QAAccordion from './QAAccordion';

export default function Page() {
  return (
    <>
      <div className='relative mt-20 p-[3%]'>
        <div className='absolute top-[5%] right-[10%] w-1/4'>
          <Image
            src="kisuki_line/speech_bubble.svg"
            alt=''
            width={400}
            height={100}
          />
        </div>
        <div className="relative w-3/4 m-auto">
          <Image
            src="/kisuki_line/title.svg"
            alt="エコな乗車でポイントゲット！"
            width={1200}
            height={800}
          />
        </div>
        <span className='text-2xl mt-15 flex justify-center'>CO2削減になる取り組みでポイントゲット！ポイントをPayPayポイントに交換！</span>
      </div>
      <div className='m-[20%] mt-15 mb-0'>
        <div className='text-xl bg-green-800 rounded-xl p-3 mt-10 text-white'>期間</div>
        <div className='mt-6'>
          <span>
            <span className="text-6xl mr-2">3.20</span>
            <span className='text-3xl'>fri</span>
            <span className='text-6xl m-3'>~</span>
            <span className="text-6xl mr-2">3.31</span>
            <span className='text-3xl'>tue</span>
            <span className='ml-3'>※PayPayポイントコードがなくなり次第終了</span>
          </span>
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
              <span className='text-xl'>木次駅を利用する</span>
            </div>
            <div className='flex flex-col'>
              <span className='mb-2'>
                木次線に乗車してください。乗車駅または降車駅で木次駅を利用してください。<br />
                木次線に乗車すると110gのCO₂を削減したといえます。
              </span>
              <Link href="#eco_reason" className='text-blue-800 underline'>詳しくはこちら</Link>
            </div>
          </div>
          <Image src="kisuki_line/polygon.svg" alt="" width={150} height={200}></Image>
          <div className='w-3/4 h-50 p-5 border-green-800 border-2 rounded-xl'>
            <div className='flex items-center gap-2 mb-3'>
              <div className='bg-green-800 w-8 h-8 rounded-full flex items-center justify-center text-white'>
                <span>3</span>
              </div>
              <span className='text-xl'>観光案内所でポイント取得</span>
            </div>
            <div className='flex flex-col'>
              <span className='mb-2'>
                1回の乗車につき110ポイントもらえます。<span className='text-sm'> ※1</span><br />
                乗車前または降車後に木次駅構内の観光案内所でecoPayのポイントが欲しいことを申し出てください。また、観光案内所の営業時間のみ対象になります。
              </span>
              <span>
                営業時間<br />
                9:00~12:00 13:00~17:00（土、日、祝 休み）
              </span>
            </div>
          </div>
          <Image src="kisuki_line/polygon.svg" alt="" width={150} height={200}></Image>
          <div className='w-3/4 h-50 p-5 border-green-800 border-2 rounded-xl'>
            <div className='flex items-center gap-2 mb-3'>
              <div className='bg-green-800 w-8 h-8 rounded-full flex items-center justify-center text-white'>
                <span>4</span>
              </div>
              <span className='text-xl'>PayPayポイントに交換<span className='text-sm'> ※2</span></span>
            </div>
            <div className='flex flex-col'>
              <span>
                ポイント取得されてから数日以内に担当者から木次線に乗車した回数のポイントコードが送信されます。また、ポイントの有効期限は2026/3/31までですので、ご注意ください。<br />
                （送信されたポイントコードの数が異なる等の不具合がありましたら、お手数ですが、ご連絡お願いします。）
              </span>
            </div>
          </div>
        </div>
      </div>
      <div className='m-[20%] mt-15 mb-0'>
        <div id='eco_reason' className='text-xl bg-green-800 rounded-xl p-3 mt-10 text-white'>木次線乗車でエコになる理由</div>
        <div className='mt-6 flex flex-col gap-8'>
          <div>
            <div className='flex items-center gap-2 mb-3'>
              <span className='text-xl'>車移動よりもCO₂排出量が少ない</span>
            </div>
            <div className='flex flex-col'>
              <span className='mb-2'>一般的なガソリン車で移動すると、多くCO2を排出しますが木次線で使われているディーゼルエンジンの場合は車移動よりも約1/3も排出量が少ないです。</span>
            </div>
          </div>
          <div>
            <div className='flex items-center gap-2 mb-3'>
              <span className='text-xl'>1度に多くの人を運べる</span>
            </div>
            <div className='flex flex-col'>
              <span className='mb-2'>バスや鉄道などの公共交通機関は、1度に多くの人を運ぶことができるため、1人あたりのCO2が少ないといえます。</span>
            </div>
          </div>
          <div>
            <div className='flex items-center gap-2 mb-3'>
              <span className='text-xl'>長期的にみてもCO2の削減に</span>
            </div>
            <div className='flex flex-col'>
              <span>路線が廃線になって遺構が、使われなくなってしまうと設備をつくるときに発生したCO2が無駄に排出されたことになります。</span>
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
                で、メールアドレス・パスワードを設定して、仮登録を行います。仮登録後、設定されたメールアドレス宛に本登録用のリンクが送信されますので、メール内のURLにアクセスして本登録を完了して、ログインをしてください。メールが届かない場合、迷惑メールフォルダ等に振り分けられていないかご確認ください。（メールは次のアドレスから送信されます。ecopay.kisukiline@gmail.com）
              </span>
            </div>
            <Image src="/kisuki_line/create_account_flow.svg" alt="アカウント新規作成方法" className='w-full p-5 pt-0' width={150} height={200}></Image>
          </div>
          <div>
            <div className='flex items-center gap-2 mb-3 mt-10'>
              <span className='text-xl'>ポイント取得方法</span>
            </div>
            <div className='flex flex-col'>
              <span className='mb-10'>
                木次駅を利用し、木次線に乗車したら、木次駅構内の観光案内所でecoPayのポイントが欲しいことを申し出てください。タブレットに表示されたQRコードをスキャンし、ポイント取得を行なってください。ポイント取得されてから数日以内に担当者から木次線に乗車した回数のポイントコードが送信されます。また、ポイントの有効期限は2026/3/31までですので、ご注意ください。<br />
                また、観光案内所の営業時間外では対応ができませんので、ご注意ください。
                <a href="https://www.unnan-kankou.jp/trip/unnanshikankouannaisho/" className='text-blue-800 underline'>観光案内所について</a>
              </span>
            </div>
            <Image src="/kisuki_line/get_point_flow.svg" alt="ポイント取得方法" className='w-full p-5 pt-0' width={150} height={200}></Image>
          </div>
        </div>
      </div>
      <div className='m-[20%] mt-15 mb-0'>
        <div className='text-xl bg-green-800 rounded-xl p-3 mt-10 text-white'>ecoPayとは</div>
        <div className='mt-6'>
          <span>
            ecoPayは、CO2削減になる取り組みを行うとポイントが発行され、そのポイントを実際に利用できるようにし、CO2排出量削減をめざしています。<br />
            気候変動などの関心が薄い人でも、ポイントがもらえることで、CO2削減になる取り組みを行うきっかけになればと思っています。<br />
          </span>
        </div>
      </div>
      <div className='m-[20%] mt-15 mb-0'>
        <div className='text-xl bg-green-800 rounded-xl p-3 mt-10 text-white'>Q&A</div>
        <div className='mt-6'>
          <QAAccordion
            items={[
              { q: 'PayPayポイントはいつもらえますか？', a: '観光案内所でecoPayポイント取得後、数日以内に担当者からポイントコードが送信されます。' },
              { q: 'PayPayポイントの有効期限は？', a: 'PayPayポイントの有効期限は2026/3/31までです。' },
              { q: '営業時間外でも取得できますか？', a: '観光案内所の営業時間のみ対象です。営業時間内に申請してください。' },
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
                ecopay.kisukiline@gmail.com または 090-4905-0102（俵）
              </span>
            </div>
          </div>
        </div>
      </div>
      <div className='m-[20%] mt-20 mb-5 flex flex-col gap-3'>
        <span>※1 1gのCO2削減で1ポイントもらえます。木次線を利用すると110gのCO2を削減できます。</span>
        <span>※2 PayPayポイントの購入は一般財団法人 地域教育魅力化プラットフォームによって行われています。また、1回のクリアにつき、1つのPayPayポイントとなります。</span>
        <span>
          ※PayPayポイントは出金、譲渡不可です。PayPay／PayPayカード公式ストアでも利用可能です。<br />
          ※PayPay、PayPayのロゴ、Pのロゴ、PayPayポイント、PayPayポイントのロゴは、PayPay株式会社の登録商標または商標です。
        </span>
        <span>※QRコードは株式会社デンソーウェーブの登録商標です。</span>
      </div>
    </>
  );
}
