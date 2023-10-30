# DevOps và hệ thống CI/CD

## Mở đầu

## Chương 1

## Chương 2: DevOps và hệ thống CI/CD

### DevOps

#### Vì sao lại cần DevOps?

Thông thường vòng đời của một sản phẩm gồm 2 giai đoạn chính: giai đoạn phát triển và giai đoạn vận hành. Giai đoạn phát triển bao gồm phần việc của Business Analyst, UI designer, Developer, QA/QC, v.v... Giai đoạn vận hành có sự tham gia của System Engineer, System Administrator, Operation Executive, Release engineer, DBA, Network Engineer, Security Engineer, v.v... Tuy nhiên hai giai đoạn này tương đối tách rời nhau đặc biệt ở những công ty có quy mô từ 

Thực tế, trong một công ty/dự án phần mềm, các đội ngũ được chia thành nhiều nhóm phát triển và vận hành. Xuất phát từ nhu cầu trái ngược, thói quen trái ngược, hiểu biết và tư tưởng trái ngược, sự khác biệt về góc nhìn đã hình thành nên Wall of confusion - "Bức tường của sự hiểu lầm" giữa các đội nhóm Dev và Ops.

#### Khái niệm DevOps

Theo định nghĩa mô hình DevOps của AWS (Amazon Web Services), "DevOps là sự kết hợp các triết lý văn hoá, thực tiễn và công cụ giúp nâng cao khả năng của tổ chức trong việc cung cấp các ứng dụng và dịch vụ với tốc độ cao, phát triển và cải tiến sản phẩm với tốc độ nhanh hơn các tổ chức sử dụng quy trình quản lý cơ sở hạ tầng và phát triển phần mềm truyền thống. Tốc độ này cho phép các tổ chức phục vụ khách hàng tốt hơn và cạnh tranh hiệu quả hơn trên thị trường". Đơn giản hơn, DevOps là viết tắt của Development (Dev) và Operations (Ops), là một quá trình đề cao sự hợp tác, kéo hai giai đoạn phát triển và vận hành xích lại gần nhau hơn.

Có thể coi DevOps là sự kết hợp của Tư tưởng mới, Công cụ mới và Kỹ năng mới. Tư tưởng mới ở đây chính là DevOps Engineer cần cần đặt lợi ích doanh nghiệp, lợi ích sản phẩm lên hàng đầu, đồng thời thấy rằng toàn bộ các team thực chất là cùng một “phe”, cùng chia sẻ lợi ích cũng như rủi ro. Vậy thì, người làm DevOps Engineer là phải có tư tưởng – mindset đúng đầu tiên.  DevOps Engineer cần là người đứng giữa có mindset của cả 2 phía để tăng cường sự hợp tác, giải quyết mâu thuẫn, phối hợp giữa các đội nhóm lại với nhau giúp quy trình phát triển phần mềm trở nên ổn định, hiệu quả hơn.

Công cụ mới là việc DevOps Engineer phải thường xuyên tìm hiểu các công cụ mới, lựa chọn, đánh giá sau đó áp dụng vào hệ thống cơ sở hạ tầng của công ty. Nhiệm vụ quan trọng của DevOps Engineer là tự động hóa hệ thống. Thậm chí DevOps Engineer tự phát triển các automation tool cho công ty.

Kỹ năng mới, DevOps Engineer là một ví trí mới với vai trò mới, hiển nhiên là yêu cầu các kỹ năng mới. Công việc chính của DevOps Engineer rất gần với công việc của Sysadmin, bao gồm: deploy, optimizing, monitoring, analysis… Điểm khác biệt là DevOps Engineer đòi hỏi nhiều kĩ năng mềm hơn, đồng thời phải biết dùng coding, scripting để automate hệ thống. Người làm DevOps Engineer cũng cần tìm hiểu về stack mà sản phẩm công ty đang sử dụng, để có thể cùng review bug, viết những unit test thông thường, và để khi phát triển tiến trình CI/CD thì deploy “êm ái” hơn. Cho nên, nếu coi DevOps Engineer là Sysadmin “kiểu mới” thì cũng không sai.

**Lịch sử hình thành DevOps**

https://www.startechup.com/blog/history-of-devops/#2007
https://everythingdevops.dev/a-brief-history-of-devops-and-its-impact-on-software-development/

Những đề xuất kết hợp các phương pháp phát triển phần mềm với khái niệm triển khai và vận hành bắt đầu xuất hiện vào cuối những năm 80, đầu những năm 90.

Năm 2007, Patrick Debois - một nhà tư vấn, quản lý dự án và là một chuyên gia Agile người Bỉ bắt đầu thực hiện một dự án di chuyển trung tâm dữ liệu cho một bộ của chính phủ Bỉ. Ông nhận thấy rằng những đội ngữ phát triển (Dev) và những đội ngữ vận hành (Ops) không phối hợp tốt với nhau. Trong khi những khoảng cách và xung đột giữa Dev và Ops luôn khiến ông lo lắng, thì việc liên tục chuyển đổi qua lại trong một dự án di chuyển trung tâm dữ liệu lớn nơi ông chịu trách nhiệm thử nghiệm đã khiến ông đặc biệt thất vọng.

Năm 2008, tại hội nghị Agile, Andrew Shafer đã tổ chức một cuộc họp để thảo luận về “Cơ sở hạ tầng Agile”. Andrew không nghĩ sẽ có ai đến nên bản thân ông ấy cũng không đến dự cuộc họp của mình. Patrick Debois xuất hiện và đi tìm Andrew vì ông ấy muốn nói về cơ sở hạ tầng Agile là giải pháp giúp các hoạt động trở nên Agile giống như các nhà phát triển. Đây là nơi DevOps bắt đầu.

Năm 2009, tại hội nghị Velocity, John Allspaw và Paul Hammond đã nói về “10+ deploys per day - Dev and Ops Cooperation at Flickr” và ý tưởng này bắt đầu thu hút được sự chú ý. Buổi nói chuyện này khiến mọi người chú ý đến những gì có thể thực hiện được bằng cách áp dụng các phương pháp thực hành DevOps ban đầu này. Ngoài ra, vào tháng 10 năm 2009, Patrick đã tổ chức hội nghị DevOpsDays đầu tiên ở Ghent, Bỉ. Nó được mô tả là “Hội nghị gắn kết sự phát triển và vận hành lại với nhau”. Đây là nơi thuật ngữ "DevOps" lần đầu tiên được sử dụng. DevOpsDays ngày nay đã trở thành hội nghị được tổ chức quốc tế và lan rộng ra khắp các quốc gia, thành phố.

Năm 2010, Jez Humble và David Farley đã viết một cuốn sách mang tính đột phá có tên là Continuous Delivery, trong đó đặt ra các nguyên tắc và thực tiễn kỹ thuật cho phép phân phối nhanh chóng. Thông qua tự động hóa các quy trình build, deploy và test, cùng với sự cộng tác được cải thiện giữa các đội nhóm developers, testers, operations và delivery có thể tạo ra sự thay đổi trong vài giờ, thậm chí là vài phút bất kể quy mô của dự án hay mức độ phức tạp.

Năm 2013, Gene Kim, Kevin Behr và George Spafford xuất bản cuốn sách The Phoenix Project, dựa trên cuốn sách The Goal của Eliyahu Goldratt. The Phoenix Project kể về một cửa hàng công nghệ thông tin trong một công ty sắp phá sản và những gì cần làm để đưa nó hoạt động trở lại. Câu chuyện này nói về việc áp dụng các nguyên tắc sản xuất tinh gọn vào việc phát triển và phân phối phần mềm.

Vào năm 2015, Tiến sĩ Nicole Forsgren, Gene Kim và Jez Humble đã thành lập một công ty khởi nghiệp có tên DORA (DevOps Research and Assessment), nơi tạo ra nghiên cứu DevOps lớn nhất cho đến nay được gọi là Báo cáo State of DevOps. Nicole là Giám đốc điều hành và là một nhà thống kê tài giỏi. Thông qua nghiên cứu này, cô nhận thấy rằng việc áp dụng phương pháp thử nghiệm để phát triển sản phẩm có thể cải thiện hiệu suất tổ chức và hiệu suất CNTT, đồng thời các tổ chức có hiệu suất cao đang vượt trội hơn hẳn so với các tổ chức có hiệu suất thấp hơn về mặt thông lượng. Nghiên cứu cho thấy rằng việc thực hiện sáng kiến ​​chuyển đổi công nghệ có thể giúp tiết kiệm chi phí đáng kể ở bất kỳ tổ chức nào.

The DevOps Handbook được xuất bản vào năm 2016. Nó được viết bởi Gene Kim, Jez Humble, Patrick Debois và John Willis như phần tiếp theo của The Phoenix Project và đóng vai trò là hướng dẫn thực tế về cách triển khai các khái niệm được giới thiệu trong cuốn sách đó. Nhân tiện, John Willis ngày đó đã làm việc tại Docker và Chef là điều phối viên cho DevOpsDays sau khi tham gia DevOpsDays ban đầu ở Ghent năm 2009 cùng với Patrick Debois.

Năm 2019, 10 năm sau DevOpsDays đầu tiên ở Ghent, Bỉ, hơn 60 sự kiện DevOpsDays đã được tổ chức tại 21 quốc gia. Patrick Debois đã lãnh đạo DevOpsDays từ khi thành lập vào năm 2009 cho đến năm 2014, và sau đó Bridget Kromhout trở thành người dẫn dắt vào năm 2015. Cô cũng là người đồng dẫn chương trình podcast rất nổi tiếng, Arrested DevOps. Nếu bạn không nghe nó, bạn nên. Cô từ chức vào năm 2020 nhưng vẫn ở trong ban cố vấn của DevOpsDays cùng với Patrick.

Những cá nhân được đề cập ở trên là một số người có ảnh hưởng lớn trong phong trào DevOps thời kỳ đầu. Họ không phải là những người duy nhất, nhưng họ đã nỗ lực và tạo nên sự khác biệt. Họ đã cho chúng ta thấy DevOps có thể có tác động như thế nào.

#### Lợi ích DevOps



#### Các giai đoạn của DevOps trong vòng đời phát triển phần mềm

![DevOps](https://orangematter.solarwinds.com/wp-content/uploads/2022/03/DevOps-lifecycle-capabilities-1024x621.png)

Vòng đời phát triển phần mềm có thể được chia thành 8 giai đoạn chính: Plan, Code, Build, Test, Release, Deploy, Operate, Monitor.

Ở giai đoạn Plan - lên kế hoạch và thiết kế sản phẩm, kỹ sư DevOps sẽ tham gia thảo luận, đánh giá và đề xuất về:

- Kiến trúc ứng dụng (Architeture): Phần mềm bao gồm những thành phần nào, luồng hoạt động ra sao, yêu cầu về cơ sở hạ tầng như nào để đội ngũ quản trị hạ tầng có thể đáp ứng được
- Những phụ thuộc (Dependencies): Phần mềm yêu cầu những công nghệ kèm theo nào, hạ tầng có sẵn hay không, có dễ maintain hay không
- Kích thước (Sizing): Phần mềm yêu cầu kích thước tài nguyên ra sao để đội ngũ quản trị sắp xếp và cấp phát cho hợp lý.
- Ngoài ra tại bước này, kỹ sư DevOps cũng đưa ra các nguyên tắc, các hướng dẫn để đội ngũ Developer thực hiện nhằm thống nhất quy trình phát triển và vận hành chung, ví dụ:
  - Git: Tổ chức git branch, phân chia môi trường, v.v... cho hệ thống CI
  - Config: Cấu hình ứng dụng như thế nào, đặt ở đâu
  - Logging: Định dạng log như thế nào, những gì nên log, log theo các cấp độ INFO, DEBUG, WARNING, ERROR, v.v...
  - Healthcheck: những ứng dụng nên được triển khai healthcheck nhằm giám sát tình trạng của ứng dụng
  - Concurrency: Khả năng đáp ứng đồng thời hỗ trợ cho việc mở rộng quy mô theo chiều ngang (Horizontal Scaling)
  - Disposability: ứng dụng phải xử lý các tín hiệu hệ thống (system signal) ví dụ `SIGHUP`, `SIGTERM`, `SIGKILL`, v.v... để graceful shutdown
  - Tracing: Tích hợp các công cụ truy vết yêu cầu để phát hiện ra lỗi hoặc độ trễ xử lý tại các service trong những ứng dụng phức tạp như các ứng dụng có kiến trúc microservice

Giai đoạn Code - lập trình phần mềm, ở giai đoạn này kỹ sư DevOps không trực tiếp tham gia vào lập trình phát triển các chức năng mà sẽ hỗ trợ quản lý git repository, tham gia vào việc review code và đánh giá

Giai đoạn build - xây dựng ứng dụng, kỹ sư DevOps sẽ dựng các công cụ để xây dựng ứng dụng và thiết kế thành một hệ thống tự động. Các công cụ có thể kể đến như Docker, Kanico, Buildah, ... để đóng gói ứng dụng dưới dạng container; Gitlab CI, Jenkins, Circle CI, v.v... để tự động quá quy trình CI, giúp đóng gói ứng dụng một cách nhanh chóng. Hiện nay phổ biến đóng gói ứng dụng bằng Docker trong đó tối ưu Dockerfile là một kỹ thuật không quá khó nhưng rất cần thiết và mang lại lợi ích rất lớn. Tối ưu Dockerfile hay tối ưu quy trình build ứng dụng có thể:

- Giảm thời gian build: tăng tốc phát triển phần mềm
- Giảm kích thước image sau khi build: dễ dàng lưu trữ, vận chuyển tới các môi trường khác nhau
- Tăng cường bảo mật cho ứng dụng

Giai đoạn Test - kiểm thử phần mềm, kỹ sư DevOps có thể tham gia viết các test case, test plan đơn giản. Chuẩn bị và xây dựng môi trường kiểm thử.

Giai đoạn Release - phát hành phần mềm, đây là giai đoạn chuyển giao phần mềm từ các đội ngũ phát triển sang đội ngũ vận hành. Kỹ sư DevOps sẽ yêu cầu đội ngũ phát triển viết tài liệu phát hành (Release note) để theo dõi những thay đổi mới giúp các đội ngũ khác như kiểm thử, vận hành tập trung theo dõi hoạt động của những thay đổi đó và theo dõi mức độ ảnh hưởng tới những thành phần khác trên hệ thống. Đánh giá những rủi ro phát sinh và lên kế hoạch migrate môi trường cũng như khả năng rollout về phiên bản cũ nếu có sự cố xảy ra; quản lý các phiên bản phát hành.

Giai đoạn Deploy - triển khai phần mềm lên các môi trường, kỹ sư DevOps tiếp nhận yêu cầu triển khai phần mềm, sau đó chuẩn bị môi trường bao gồm tài nguyên cơ sở hạ tầng và các thành phần phụ thuộc của ứng dụng. Xây dựng hệ thống CD để tự động quy trình triển khai cũng như phân phối các phiên bản ứng dụng tới những môi trường khác nhau.

Giai đoạn Operate - vận hành phần mềm, kỹ sư DevOps sẽ xây dựng và cung cấp cho đội ngũ phát triển những công cụ để họ có thể tiếp cận sâu hơn vào việc vận hành sản phẩm, phát hiện và sửa lỗi nhanh nhất có thể. Có thể kể đến một số hạng mục cần theo dõi như:

- Centralize log: Hệ thống theo dõi log tập trung để phát hiện lỗi
- Resource monitoring: Giám sát lượng tài nguyên ứng dụng sử dụng để đưa ra kế hoạch tối ưu hiệu năng
- CI/CD dashboard: Theo dõi quá trình CI/CD để biết tình trạng của ứng dụng
- Tracing: truy vết lỗi hệ thống
- Notification: hệ thống gửi thông báo khi có sự cố bất thường xảy ra với ứng dụng

Giai đoạn Monitor - Giám sát phần mềm, ở giai đoạn này kỹ sư DevOps cùng với đội ngũ quản trị, vận hành hệ thống thực hiện giám sát toàn bộ hệ thống không chỉ riêng từng ứng dụng. Giám sát lượng tài nguyên tổng, lên kế hoạch mở rộng quy mô cơ sở hạ tầng, đánh giá rủi ro, lên kế hoạch sao lưu, khôi phục sau thảm hoạ (disaster recovery). Tìm hiểu công nghệ mới để áp dụng tối ưu quy trình hệ thống. Đồng thời cũng triển khai những hệ thống monitoring/alerting khi có sự cố hệ thống xảy ra.

Tham khảo: 
- https://12factor.net/
- https://techmaster.vn/posts/36145/the-nao-moi-la-mot-devops-thuc-su

#### GitOps và DevSecOps

**GitOps**

GitOps là một khung làm việc sử dụng các phương pháp hay nhất của DevOps để phát triển ứng dụng như kiểm soát phiên bản, tính cộng tác, sự tuân thủ nguyên tắc và quy trình CI/CD rồi áp dụng chúng vào tự động hóa cơ sở hạ tầng. Như tên gọi, GitOps lấy Git làm trung tâm của các hoạt động của đội nhóm, doanh nghiệp. Ý tưởng chính của GitOps là biến Git trở thành một nguồn của sự thật (Single Source of Truth - SSOT) lưu trữ toàn bộ cấu hình triển khai cơ sở hạ tầng cũng như cấu hình triển khai ứng dụng.

GitOps yêu cầu 3 thành phần cốt lõi: GitOps = IaC + MRs + CI/CD

- IaC (Infrastrcuture as Code) - Cơ sở hạ tầng dưới dạng mã: GitOps sử dụng kho lưu trữ Git làm SSOT duy nhất cho các định nghĩa cơ sở hạ tầng. Dựa vào tính năng kiểm soát phiên bản, theo dõi sự thay đổi mã nguồn của Git, việc thực hiện cơ sở hạ tầng dưới dạng mã giúp tăng tốc triển khai, giám sát trạng thái cấu hình hệ thống, đảm bảo khả năng phục hồi.

- MR - Merge request: GitOps sử dụng các merge request làm cơ chế thay đổi cho tất cả các bản cập nhật cơ sở hạ tầng. MR là nơi các đội nhóm có thể cộng tác thông qua các đánh giá và nhận xét và là nơi ra phê duyệt quyết định thay đổi cơ sở hạ tầng chính thức.

- CI/CD : GitOps tự động cập nhật cơ sở hạ tầng bằng quy trình làm việc Git với tích hợp liên tục (CI) và phân phối liên tục (CD). Khi mã nguồn mới được hợp nhất, CI/CD pipeline thực hiện sự thay đổi trong môi trường. Bất kỳ sai lệch cấu hình nào, chẳng hạn như các thay đổi hoặc lỗi, đều được ghi đè bởi GitOps để môi trường thay đổi về trạng thái mong muốn được cấu hình trong Git.

GitOps cung cấp:

- Quy trình làm việc tiêu chuẩn để phát triển ứng dụng
- Tăng cường bảo mật để thiết lập trước các yêu cầu ứng dụng
- Cải thiện độ tin cậy với khả năng hiển thị và kiểm soát phiên bản thông qua Git
- Tính nhất quán trên mọi môi trường cluster (cụm máy chủ), cloud (điện toán đám mây) và on-premise (tại doanh nghiệp)

Trong đồ án này sẽ trình bày cụ thể về một trong các công cụ triển khai GitOps là ArgoCD. Bên cạnh đó còn có các công cụ khác như Flux, Gitkube, JenkinsX, v.v...

**DevSecOps**

![DevSecOps](https://marvel-b1-cdn.bc0a.com/f00000000236551/dt-cdn.net/images/devsecops-image-2000-6557ba1b00.png)

DevSecOps là mở rộng của DevOps. Thông thường khâu kiểm thử bảo mật là một khâu riêng biệt sẽ diễn ra bắt đầu từ cuối khâu phát triển phần mềm. DevSecOps cũng tự biến việc kiểm thử bảo mật thành một phần trong quá trình phát triển ứng dụng. Ví dụ: các đội ngũ bảo mật sẽ thiết lập tường lửa, lập trình viên thì thiết kế mã ngăn chặn lỗ hổng, còn kỹ sư kiểm thử sẽ tiến hành kiểm thử mọi thay đổi nhằm ngăn chặn truy cập trái phép của bên thứ ba. Việc áp dụng các nguyên tắc bảo mật ngay từ đầu giai đoạn phát triển phần mềm giúp phát hiện lỗ hổng sớm và dễ dàng khắc phục hơn là sau khi xây dựng xong một hệ thống phức tạp.

Chúng ta có thể tham khảo luồng hoạt động của DevSecOps như hình dưới.

![DevSecOps pipeline](https://d33wubrfki0l68.cloudfront.net/81fbed5f6b2223cbb02b799bbd6216860c2d0c32/e0ecd/assets/img/blog/devsecops-pipeline/devsecops-pipeline-diagram.png)

Lợi ích của việc sử dụng DevSecOps là gì?

    Tìm lỗ hổng và lỗi ở giai đoạn phát triển trước đó
    Tuân thủ hợp lý
    Phục hồi nhanh chóng
    Chuỗi cung ứng an toàn
    Tiết kiệm chi phí
    Có thể bao gồm giám sát dựa trên AI để phát hiện sự bất thường
    Giảm nguy cơ tấn công bề mặt và tăng độ tin cậy
    Hiển thị đầy đủ các mối đe dọa tiềm ẩn và các cách khả thi để khắc phục nó

### Hệ thống CI/CD

#### CI/CD là gì?

![ci-cd-pipline](https://solidstudio.io/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Flofvu8al%2Fproduction%2Fe37ce13c88889f048aa2b1acae7d6cbfeea5678f-2048x876.png&w=2048&q=75)

CI (Continuous Integration) - Tích hợp liên tục, đề cập đến việc tự động hóa việc tích hợp mã nguồn từ các thành viên trong nhóm phát triển vào một kho lưu trữ mã nguồn (ví dụ: Git) một cách sớm và thường xuyên hơn. Mỗi khi có sự thay đổi về mã nguồn, mã sẽ được tự động kiểm thử bằng các quy trình xác thực mã. Thông thường các quy trình bắt đầu bằng việc phân tích mã tĩnh để xác minh chất lượng của mã. Sau khi mã vượt qua các bài kiểm thử tĩnh, các quy trình CI tự động sẽ đóng gói và biên dịch mã để kiểm thử động. Các quy trình CI phải có hệ thống kiểm soát phiên bản theo dõi các thay đổi để biết phiên bản mã được sử dụng.

Mục tiêu của CI là đảm bảo rằng mã nguồn mới được thêm vào dự án không gây ra lỗi tích hợp và không làm hỏng công việc của các thành viên khác. Với sự tích hợp liên tục, các lỗi và vấn đề bảo mật có thể được xác định và sửa chữa dễ dàng hơn và sớm hơn nhiều trong quá trình phát triển.

Bằng cách hợp nhất các thay đổi thường xuyên và kích hoạt các quy trình kiểm thử và xác thực tự động, hệ thống CI giúp giảm thiểu khả năng xung đột mã, ngay cả khi có nhiều nhà phát triển làm việc trên cùng một ứng dụng. Một lợi ích lớn mà hệ thống CI mang lại đó chính là rút ngắn khoảng thời gian chờ từ khi các nhà phát triển commit code cho đến khi nhận được phản hồi đánh giá chất lượng mã nguồn từ các bộ phận khác và tiến hành thay đổi, sửa lỗi. Với CI, các nhà phát triển không phải đợi lâu để có kết quả đánh giá chất lượng mã nguồn từ đó có thể sẵn sàng sửa các lỗi và vấn đề bảo mật sớm nhất có thể.

CD (Continuous delivery/Continuous deployment), thuật ngữ CD có 2 nghĩa là Phân phối liên tục và Triển khai liên tục.
Phân phối liên tục đề cập đến việc tự động hóa quy trình cung cấp cơ sở hạ tầng và phát hành ứng dụng. Sau khi mã đã được test và build, hệ thống Phân phối liên tục sẽ tiếp quản các giai đoạn cuối cùng để đảm bảo mã được đóng gói với mọi thứ cần thiết để triển khai trên mọi môi trường vào bất kỳ lúc nào. Phân phối liên tục có thể bao gồm mọi công đoạn từ việc cung cấp cơ sở hạ tầng đến việc phân phối ứng dụng tới các môi trường thử nghiệm hoặc sản xuất.

Với Phân phối liên tục, phần mềm được xây dựng có thể triển khai vào môi trường sản xuất bất kỳ lúc nào. Việc triển khai có thể kích hoạt theo cách thủ công hoặc chuyển sang Triển khai liên tục, trong đó việc triển khai cũng được tự động hóa.

Triển khai liên tục là giai đoạn cuối của quá trình CI/CD. Triển khai liên tục là phần mở rộng của Phân phối liên tục, cho phép các tổ chức triển khai ứng dụng của họ một cách tự động, loại bỏ nhu cầu can thiệp của con người. Với việc triển khai liên tục, các nhóm DevOps đặt ra trước các tiêu chí cho việc phát hành mã và khi các tiêu chí đó được đáp ứng và xác thực, mã sẽ được triển khai vào môi trường sản xuất. Điều này cho phép các tổ chức hoạt động linh hoạt hơn và đưa các tính năng mới đến tay người dùng nhanh hơn.

Mặc dù có thể thực hiện tích hợp liên tục mà không cần phân phối hoặc triển khai liên tục, nhưng thực sự không thể thực hiện CD nếu không có sẵn CI. Đó là bởi vì sẽ cực kỳ khó để có thể triển khai vào môi trường sản xuất bất cứ lúc nào nếu không thực hành các nguyên tắc cơ bản về CI như tích hợp mã vào kho lưu trữ chung, tự động hóa kiểm thử và xây dựng cũng như thực hiện tất cả theo từng đợt nhỏ hàng ngày. Thực tế việc Triển khai liên tục sẽ không được khuyến khích áp dụng với môi trường sản xuất mà chỉ áp dụng với các môi trường phát triển, kiểm thử, UAT, stagging, v.v... bởi môi trường sản xuất là quan trọng nhất, bước cuối cùng triển khai cần phải thực hiện thủ công, yêu cầu sự đánh giá và chấp thuận của cá nhân/tổ chức có thẩm quyền.

Với CI/CD, mỗi thay đổi mã nguồn của nhà phát triển đều có thể xuất hiện trên ứng dụng trong vài phút hoặc vài giờ (trong trường hợp mã nguồn vượt qua quá trình kiểm thử tự động). Điều này giúp việc liên tục nhận phản hồi dễ dàng hơn nhiều từ đó việc thay đổi, sửa đổi, sửa lỗi diễn ra thường xuyên hơn. Kết hợp lại với nhau, tất cả các phương pháp CI/CD được kết nối này giúp việc triển khai ứng dụng ít rủi ro hơn, nhờ đó việc phát hành các thay đổi đối với ứng dụng theo từng phần nhỏ sẽ dễ dàng hơn thay vì tất cả cùng một lúc. Tuy nhiên, cũng cần phải đầu tư trước rất nhiều nỗ lực vì hệ thống tự động cần được xây dựng một cách phù hợp và đảm bảo vận hành trơn tru trong từng giai đoạn, từng trường hợp trong quy trình CI/CD.

#### CI/CD pipeline

https://solidstudio.io/blog/ci-cd-pipelines

Quy trình CI/CD có thể được cụ thể hóa gồm các công đoạn sau

- Bước 1: Nhà phát triển commit code
- Bước 2: Kiểm thử mã nguồn bằng phân tích tĩnh
- Bước 3: Build ứng dụng
- Bước 4: Kiểm thử ứng dụng bằng các Unit test
- Bước 5: Kiểm thử tích hợp ứng dụng
- Bước 6: Đóng gói ứng dụng
- Bước 7: Cung cấp cơ sở hạ tầng và phân phối ứng dụng đến các môi trường
- Bước 8: Tự động triển khai ứng dụng lên các môi trường

#### Nguyên tắc trong CI/CD

CICD Fundamentals 

CI/CD (Continuous Integration/Continuous Deployment) is a fundamental approach in software development that emphasizes automation, collaboration, and iterative improvement. 

Here are some key aspects of CI/CD:

    Continuous improvement: CI/CD focuses on improving processes, eliminating bottlenecks, and delivering high-quality software faster.
    Automated builds: Ensures consistent and reliable builds by automating code compilation, testing, and packaging.
    Continuous testing: Automated tests provide quick feedback, ensuring robust and bug-free software.
    Streamlined deployments: Automated deployment process minimizes manual effort and reduces errors.
    Self-builds: Developers verify changes locally, ensuring code stability and taking ownership.
    Version control: Centralized repository manages code changes, enabling collaboration and maintaining project history.
    Feedback loop: Rapid feedback on code changes fosters continuous learning and improvement.
    Infrastructure as code: Automates environment setup, reducing errors and enabling scalability.
    Frequent check-ins: Regular code commits promote collaboration and keep everyone updated.
    Collaboration and communication: Breaks down silos, and encourages teamwork, effective communication, and shared goals.

By embracing these CI/CD fundamentals, organizations can streamline their development processes, enhance code quality, accelerate time to market, and achieve greater efficiency and innovation.

#### Lợi ích của CI/CD

https://about.gitlab.com/blog/2022/02/15/ten-reasons-why-your-business-needs-ci-cd/

- Phát hành ứng dụng thường xuyên hơn: Việc phát hành phần mềm có thể là một công việc khó khăn, kéo dài hàng tuần tích hợp, cấu hình và thử nghiệm thủ công. Tích hợp, phân phối và triển khai liên tục (CI/CD) mang lại cách thức tốt hơn, cho phép các tổ chức phát hành thường xuyên hơn mà không ảnh hưởng đến chất lượng. CI/CD tự động hóa các tác vụ lặp đi lặp lại và thông báo cho các đội nhóm về mọi vấn đề, giúp quá trình phát hành diễn ra suôn sẻ và hiệu quả hơn.

- Rút ngắn vòng đời phát triển phần mềm: Với quy trình CI/CD tự động, các nhà phát triển có thể tạo ra các thay đổi cho ứng dụng phần mềm hàng tuần, hàng ngày hoặc thậm chí hàng giờ, giúp rút ngắn thời gian đưa ra thị trường cũng như khả năng đáp ứng xu hướng và nhu cầu của người dùng.

- Cải thiện chất lượng sản phẩm trước khi phát hành: Kiểm tra tự động thường xuyên và kỹ lưỡng sẽ mang lại chất lượng mã tốt hơn vì các lỗi được phát hiện sớm hơn và được sửa trước khi có nhiều chức năng hơn được xây dựng trên chúng.

- Tăng hiệu suất của các nhóm phát triển: Tự động hóa các nhiệm vụ lặp đi lặp lại giúp các nhà phát triển tập trung hơn vào vấn đề họ cần giải quyết, nâng cao chất lượng công việc, thúc đẩy sự sáng tạo.

#### Một số công cụ triển khai CI/CD

## Chương 3: Triển khai hệ thống CI/CD

### Các công nghệ sử dụng

- Vagrant + VirtualBox: Tạo máy ảo
- Ansible:
  - Dựng k8s cluster
  - Cài đặt Gitlab, Gitlab runner

- RKE2: Môi trường k8s
- ArgoCD: Công cụ chạy CD được cài đặt trên môi trường k8s

Môi trường lab: Hệ điều hành Kubuntu 22.04 LTS

### Tạo máy ảo với Vagrant và VirtualBox

**Vagrant**

Vagrant là gì?  

Cài đặt Vagrant

Thực hiện thêm chữ ký số và kho phân phối của HashiCorp danh sách của APT, cập nhật APT và cài đặt Vagrant

```sh
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant
```

Kiểm tra Vagrant đã được cài đặt hay chưa bằng lệnh 

```sh
vagrant version
```

**VirtualBox**

VirtualBox là gì

Cài đặt VirtualBox

### Cài đặt RKE2 và Gitlab sử dụng Ansible

Ansible là gì

Cài đặt Ansible

Điều kiện tiên quyết:
- Đối với máy điều khiển (control node - máy chạy Ansible), bạn có thể sử dụng gần như mọi máy giống UNIX được cài đặt Python 3.9 hoặc mới hơn. Điều này bao gồm Red Hat, Debian, Ubuntu, macOS, BSD và Windows trong bản phân phối Hệ thống con Windows cho Linux (WSL). Windows không có WSL không được hỗ trợ nguyên bản như một nút điều khiển; xem bài đăng trên blog của Matt Davis để biết thêm thông tin

- Đối với máy được quản lý (managed node, remote host). Nút được quản lý (máy mà Ansible đang quản lý) không yêu cầu cài đặt Ansible mà yêu cầu Python 2.7 hoặc Python 3.5 - 3.11 để chạy mã Python do Ansible tạo. Nút được quản lý cũng cần một tài khoản người dùng có thể kết nối thông qua SSH với nút có shell POSIX tương tác.

Ansible được cài đặt thông qua trình quản lý gói của Python - PIP. Để kiểm tra PIP được cài đặt hay chưa ta chạy lệnh

```sh
python3 -m pip -V
```

Nếu chưa, cài đặt PIP theo cú pháp sau

```sh
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
```

Cài đặt Ansible

```sh
python3 -m pip install --user ansible
```

Để có thể chạy được lệnh của ansible ở mọi nơi, ta cần phải thay đổi biến PATH

## Chương 4: Kết luận

